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
      local under_cursor_highlights_group =
        vim.api.nvim_create_augroup("lukeramljak/cursor_highlights", { clear = false })
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
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = false,
  virtual_text = {
    spacing = 2,
    format = function(diagnostic)
      -- Use shorter, nicer names for some sources:
      local special_sources = {
        ["Lua Diagnostics."] = "lua",
        ["Lua Syntax Check."] = "lua",
      }

      local message = diagnostic_icons[vim.diagnostic.severity[diagnostic.severity]]
      if diagnostic.source then
        message = string.format("%s %s", message, special_sources[diagnostic.source] or diagnostic.source)
      end
      if diagnostic.code then
        message = string.format("%s[%s]", message, diagnostic.code)
      end

      return message .. " "
    end,
  },
  float = {
    source = "if_many",
    -- Show severity icons as prefixes
    prefix = function(diag)
      local level = vim.diagnostic.severity[diag.severity]
      local prefix = string.format(" %s ", diagnostic_icons[level])
      return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
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
