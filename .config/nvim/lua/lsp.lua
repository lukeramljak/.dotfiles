local diagnostic_icons = require("icons").diagnostics

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    local methods = vim.lsp.protocol.Methods

    if not client then
      return
    end

    if client:supports_method(methods.textDocument_formatting) then
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = bufnr, desc = "Format current buffer" })
    end

    if client:supports_method(methods.textDocument_documentHighlight) then
      local under_cursor_highlights_group = vim.api.nvim_create_augroup("user_cursor_highlights", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
        group = under_cursor_highlights_group,
        desc = "Highlight references under the cursor",
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
        group = under_cursor_highlights_group,
        desc = "Clear highlight references",
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostic_icons.ERROR,
      [vim.diagnostic.severity.WARN] = diagnostic_icons.WARN,
      [vim.diagnostic.severity.INFO] = diagnostic_icons.INFO,
      [vim.diagnostic.severity.HINT] = diagnostic_icons.HINT,
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

-- Set up LSP servers
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    local server_configs = vim
      .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end)
      :totable()
    vim.lsp.enable(server_configs)
  end,
})
