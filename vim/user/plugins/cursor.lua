local function setup_when_plug_loaded(name, setup_fn)
  local plugs = vim.g.plugs or {}
  if plugs[name] and plugs[name].loaded == 1 then
    setup_fn()
    return
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = name,
    once = true,
    callback = setup_fn,
  })
end

setup_when_plug_loaded("cursor-agent.nvim", function()
  require("cursor-agent").setup({
    -- Executable or argv table. Example: "cursor-agent" or {"/usr/local/bin/cursor-agent"}
    cmd = "cursor-agent",
    -- Additional arguments always passed to the CLI
    args = {},
  })
end)
