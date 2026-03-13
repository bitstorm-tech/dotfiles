return {
  name = 'fn-separators',
  dir = '.',
  config = function()
    local ns = vim.api.nvim_create_namespace 'fn_separators'
    local enabled = true

    -- Node types per language that represent functions/methods
    local node_types = {
      lua = { 'function_declaration', 'function_definition_statement' },
      go = { 'function_declaration', 'method_declaration' },
      typescript = { 'function_declaration', 'method_definition', 'export_statement' },
      javascript = { 'function_declaration', 'method_definition', 'export_statement' },
      tsx = { 'function_declaration', 'method_definition', 'export_statement' },
      php = { 'function_definition', 'method_declaration' },
      python = { 'function_definition' },
      rust = { 'function_item' },
      kotlin = { 'function_declaration' },
      c_sharp = { 'method_declaration' },
    }

    -- Languages where we also look inside class bodies
    local class_containers = {
      c_sharp = { 'class_declaration' },
      kotlin = { 'class_declaration' },
      php = { 'class_declaration' },
      typescript = { 'class_declaration' },
      javascript = { 'class_declaration' },
      tsx = { 'class_declaration' },
    }

    local function has_function_child(node)
      for child in node:iter_children() do
        local t = child:type()
        if t == 'function_declaration' or t == 'function' or t == 'arrow_function' then
          return true
        end
      end
      return false
    end

    local function collect_from_node(node, lang, lines)
      local types = node_types[lang]
      if not types then
        return
      end
      local type_set = {}
      for _, t in ipairs(types) do
        type_set[t] = true
      end

      for child in node:iter_children() do
        local t = child:type()
        if t == 'export_statement' then
          if has_function_child(child) then
            local row = child:start()
            lines[row] = true
          end
        elseif type_set[t] then
          local row = child:start()
          lines[row] = true
        end

        -- Look inside class bodies
        local containers = class_containers[lang]
        if containers then
          for _, ct in ipairs(containers) do
            if t == ct then
              -- Find the class_body / declaration_list child
              for class_child in child:iter_children() do
                local cct = class_child:type()
                if cct == 'class_body' or cct == 'declaration_list' then
                  collect_from_node(class_child, lang, lines)
                end
              end
            end
          end
        end
      end
    end

    local function get_function_lines(bufnr)
      local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
      if not ok or not parser then
        return {}
      end

      local lines = {}
      parser:for_each_tree(function(tree, lang_tree)
        local lang = lang_tree:lang()
        local root = tree:root()
        collect_from_node(root, lang, lines)
      end)

      -- Convert to sorted list
      local sorted = {}
      for line in pairs(lines) do
        sorted[#sorted + 1] = line
      end
      table.sort(sorted)

      -- Remove first function (no separator above the first one)
      if #sorted > 0 then
        table.remove(sorted, 1)
      end

      return sorted
    end

    local function render_separators(bufnr)
      if not enabled then
        return
      end
      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end
      if vim.bo[bufnr].buftype ~= '' then
        return
      end

      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

      local lines = get_function_lines(bufnr)
      if #lines == 0 then
        return
      end

      -- Calculate width from current window
      local win = vim.fn.bufwinid(bufnr)
      if win == -1 then
        return
      end
      local wininfo = vim.fn.getwininfo(win)
      local width = wininfo[1].width - wininfo[1].textoff
      local separator = string.rep('─', width)

      for _, line in ipairs(lines) do
        pcall(vim.api.nvim_buf_set_extmark, bufnr, ns, line, 0, {
          virt_lines_above = true,
          virt_lines = { { { separator, 'FnSeparator' } } },
        })
      end
    end

    -- Debounce timer per buffer
    local timers = {}

    local function render_debounced(bufnr)
      if timers[bufnr] then
        timers[bufnr]:stop()
      else
        timers[bufnr] = vim.uv.new_timer()
      end
      timers[bufnr]:start(150, 0, function()
        vim.schedule(function()
          render_separators(bufnr)
        end)
      end)
    end

    -- Highlight group
    vim.api.nvim_set_hl(0, 'FnSeparator', { link = 'Comment', default = true })

    -- Autocommands
    local group = vim.api.nvim_create_augroup('FnSeparators', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
      group = group,
      callback = function(args)
        if vim.bo[args.buf].buftype == '' then
          render_separators(args.buf)
        end
      end,
    })

    vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
      group = group,
      callback = function(args)
        if vim.bo[args.buf].buftype == '' then
          render_debounced(args.buf)
        end
      end,
    })

    vim.api.nvim_create_autocmd('WinResized', {
      group = group,
      callback = function()
        for _, win in ipairs(vim.v.event.windows) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].buftype == '' then
            render_separators(buf)
          end
        end
      end,
    })

    -- Toggle command
    vim.api.nvim_create_user_command('SeparatorsToggle', function()
      enabled = not enabled
      if enabled then
        -- Re-render all visible buffers
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].buftype == '' then
            render_separators(buf)
          end
        end
        vim.notify('Function separators enabled', vim.log.levels.INFO)
      else
        -- Clear all buffers
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
          end
        end
        vim.notify('Function separators disabled', vim.log.levels.INFO)
      end
    end, {})
  end,
}
