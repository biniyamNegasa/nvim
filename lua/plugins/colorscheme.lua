local uv = vim.uv
local file_path = vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua")

local default = {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "gruvbox",
  },
}

if uv.fs_stat(file_path) then
  local success, result = pcall(dofile, file_path)
  if success and type(result) == "table" then
    return result
  end
end

return default
