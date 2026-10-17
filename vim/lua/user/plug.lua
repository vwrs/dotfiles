local M = {}

-- vim-plug adds a plugin to runtimepath when it is loaded,
-- and fires `User <name>` only when a lazy (on/for) plugin is loaded.
local function is_loaded(name)
  local plug = (vim.g.plugs or {})[name]
  if not plug then
    return false
  end
  local dir = plug.dir:gsub("/$", "")
  for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
    if path:gsub("/$", "") == dir then
      return true
    end
  end
  return false
end

function M.setup_when_loaded(name, setup_fn)
  if is_loaded(name) then
    setup_fn()
    return
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = name,
    once = true,
    callback = setup_fn,
  })
end

return M
