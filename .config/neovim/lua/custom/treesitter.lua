local M = {}

local nvim_treesitter = require 'nvim-treesitter'

local group = vim.api.nvim_create_augroup('custom-treesitter', { clear = true })

local function get_lang(filetype)
  if not filetype or filetype == '' then
    return nil
  end

  return vim.treesitter.language.get_lang(filetype) or filetype
end

local function has_parser(lang)
  if not lang or lang == '' then
    return false
  end

  return pcall(vim.treesitter.language.inspect, lang)
end

local function has_indent_query(lang)
  return pcall(vim.treesitter.query.get, lang, 'indents')
end

local function enable_features(bufnr)
  local lang = get_lang(vim.bo[bufnr].filetype)
  if not lang then
    return
  end

  if not has_parser(lang) then
    nvim_treesitter.install(lang)
    return
  end

  pcall(vim.treesitter.start, bufnr, lang)

  if has_indent_query(lang) then
    vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

function M.setup(languages)
  nvim_treesitter.setup()
  nvim_treesitter.install(languages)

  vim.api.nvim_clear_autocmds { group = group }
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    callback = function(args)
      enable_features(args.buf)
    end,
  })

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      enable_features(bufnr)
    end
  end
end

return M
