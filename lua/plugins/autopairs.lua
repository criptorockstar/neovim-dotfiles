local M = {
  "windwp/nvim-autopairs",
  lazy = false, 
}

local autopairs_status_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status_ok then
  M.config = true
  return M
end

M.config = function()
  autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" }
  })  
end

return M
