-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Export typst to pdf
vim.api.nvim_create_user_command("TypstExport", function()
  local file = vim.api.nvim_buf_get_name(0)
  vim.lsp.buf_request(0, "workspace/executeCommand", {
    command = "tinymist.exportPdf",
    arguments = {
      file,
      {
        format = "pdf",
        path = file:gsub("%.typ$", ".pdf"),
        mainFile = file,
        root = vim.fn.getcwd(),
        omitArguments = false,
        ppi = 144,
      },
    },
  }, function(err)
    if err then
      vim.notify("Tinymist export failed: " .. err.message, vim.log.levels.ERROR)
    else
      vim.notify("PDF exported successfully!", vim.log.levels.INFO)
    end
  end)
end, {})

-- CompetiTest related

vim.keymap.set("n", "<F5>", function()
  vim.cmd("CompetiTest run")
end, { desc = "Run testcases" })

vim.keymap.set("n", "<F6>", function()
  vim.cmd("CompetiTest receive problem")
end, { desc = "Receive problem" })

vim.keymap.set("n", "<F7>", function()
  vim.cmd("CompetiTest receive contest")
end, { desc = "Receive contest" })
