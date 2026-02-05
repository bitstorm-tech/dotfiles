-- Custom Telescope highlighter that highlights ALL matches in path
-- instead of just the last match (default fzf behavior)

local M = {}

local function normalize_prompt_term(term)
  if term == '' then
    return nil
  end
  if term:sub(1, 1) == '!' then
    return nil
  end
  if term:sub(1, 1) == "'" then
    term = term:sub(2)
  end
  if term:sub(1, 1) == '^' then
    term = term:sub(2)
  end
  if term:sub(-1) == '$' then
    term = term:sub(1, -2)
  end
  if term == '' then
    return nil
  end
  return term
end

local function prompt_terms(prompt)
  local terms = {}
  for word in prompt:gmatch('%S+') do
    for chunk in word:gmatch('[^|]+') do
      local term = normalize_prompt_term(chunk)
      if term then
        table.insert(terms, term)
      end
    end
  end
  return terms
end

local function highlight_all_matches(self, prompt, display)
  if not prompt or prompt == '' then
    return
  end
  if self and self.__highlight_prefilter then
    prompt = self:__highlight_prefilter(prompt)
  end
  local terms = prompt_terms(prompt)
  if #terms == 0 then
    return
  end
  local case_sensitive = prompt:find('%u') ~= nil
  local haystack = case_sensitive and display or display:lower()
  local highlights = {}
  for _, term in ipairs(terms) do
    local needle = case_sensitive and term or term:lower()
    if needle ~= '' then
      local start = 1
      while true do
        local s, e = haystack:find(needle, start, true)
        if not s then
          break
        end
        table.insert(highlights, { start = s, finish = e })
        start = s + 1
      end
    end
  end
  if #highlights == 0 then
    return
  end
  return highlights
end

function M.file_sorter(opts)
  local telescope = require('telescope')
  local sorter
  if telescope.extensions and telescope.extensions.fzf and telescope.extensions.fzf.native_fzf_sorter then
    local fzf_opts = vim.tbl_extend('force', opts or {}, { case_mode = 'smart_case' })
    sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts)
  else
    sorter = require('telescope.sorters').get_fzy_sorter(opts)
  end
  sorter.highlighter = highlight_all_matches
  return sorter
end

function M.generic_sorter(opts)
  local sorter = require('telescope.sorters').get_generic_fuzzy_sorter(opts)
  sorter.highlighter = highlight_all_matches
  return sorter
end

return M
