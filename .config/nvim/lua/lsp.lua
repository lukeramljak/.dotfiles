local diagnostic_icons = require("icons").diagnostics

local M = {}

vim.g.inlay_hints = false

vim.lsp.codelens.enable(true)

---@param action lsp.CodeActionKind | string
function M.action(action)
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { action },
      diagnostics = {},
    },
  })
end

--- Appends `new_names` to `root_files` if `field` is found in any such file in any ancestor of `fname`.
---
--- NOTE: this does a "breadth-first" search, so is broken for multi-project workspaces:
--- https://github.com/neovim/nvim-lspconfig/issues/3818#issuecomment-2848836794
---
--- @param root_files string[] List of root-marker files to append to.
--- @param new_names string[] Potential root-marker filenames (e.g. `{ 'package.json', 'package.json5' }`) to inspect for the given `field`.
--- @param field string Field to search for in the given `new_names` files.
--- @param fname string Full path of the current buffer name to start searching upwards from.
function M.root_markers_with_field(root_files, new_names, field, fname)
  local path = vim.fn.fnamemodify(fname, ":h")
  local found = vim.fs.find(new_names, { path = path, upward = true, type = "file" })

  for _, f in ipairs(found or {}) do
    -- Match the given `field`.
    for line in io.lines(f) do
      if line:find(field) then
        root_files[#root_files + 1] = vim.fs.basename(f)
        break
      end
    end
  end

  return root_files
end

function M.insert_package_json(root_files, field, fname)
  return M.root_markers_with_field(root_files, { "package.json", "package.json5" }, field, fname)
end

---Resolves a command to its local node_modules/.bin version if available,
---falling back to the global command otherwise.
---@param cmd string The command name to resolve (e.g. "vscode-langservers-extracted")
---@param config vim.lsp.ClientConfig LSP client config, used to determine root_dir
---@return string cmd The resolved command path
function M.resolve_node_modules_cmd(cmd, config)
  if (config or {}).root_dir then
    local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
    if vim.fn.executable(local_cmd) == 1 then
      return local_cmd
    end
  end
  return cmd
end

--- Sets up LSP keymaps and autocommands for the given buffer.
---@param client vim.lsp.Client
---@param bufnr integer
local function on_attach(client, bufnr)
  ---@param lhs string
  ---@param rhs string|function
  ---@param opts string|vim.keymap.set.Opts
  ---@param mode? string|string[]
  local function keymap(lhs, rhs, opts, mode)
    mode = mode or "n"
    ---@cast opts vim.keymap.set.Opts
    opts = type(opts) == "string" and { desc = opts } or opts
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  keymap("[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, "Previous diagnostic")
  keymap("]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, "Next diagnostic")
  keymap("[e", function()
    vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
  end, "Previous error")
  keymap("]e", function()
    vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
  end, "Next error")

  if client:supports_method("textDocument/codeAction") then
    require("lightbulb").attach_lightbulb(bufnr, client)
  end

  if client:supports_method("textDocument/documentColor") then
    keymap("grc", function()
      vim.lsp.document_color.color_presentation()
    end, "vim.lsp.document_color.color_presentation()", { "n", "x" })
  end

  if client:supports_method("textDocument/references") then
    keymap("grr", function()
      MiniExtra.pickers.lsp({ scope = "references" })
    end, "vim.lsp.buf.references()")
  end

  if client:supports_method("textDocument/typeDefinition") then
    keymap("gy", function()
      MiniExtra.pickers.lsp({ scope = "type_definition" })
    end, "Go to type definition")
  end

  if client:supports_method("textDocument/documentSymbol") then
    keymap("<leader>fs", function()
      MiniExtra.pickers.lsp({ scope = "document_symbol" })
    end, "Document symbols")
  end

  if client:supports_method("workspace/symbol") then
    keymap("<leader>fS", function()
      MiniExtra.pickers.lsp({ scope = "workspace_symbol_live" })
    end, "Workspace symbols")
  end

  if client:supports_method("textDocument/declaration") then
    keymap("gD", function()
      MiniExtra.pickers.lsp({ scope = "declaration" })
    end, "Go to declaration")
  end

  if client:supports_method("textDocument/definition") then
    keymap("gd", "<cmd>Pick lsp_definition<cr>", "Go to definition")
  end

  if client:supports_method("textDocument/signatureHelp") then
    keymap("<C-k>", function()
      vim.lsp.buf.signature_help()
    end, "Signature help", "i")
  end

  if client:supports_method("textDocument/documentHighlight") then
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

  if client:supports_method("textDocument/inlayHint") then
    local inlay_hints_group = vim.api.nvim_create_augroup("lukeramljak/toggle_inlay_hints", { clear = false })

    if vim.g.inlay_hints then
      -- Initial inlay hint display
      -- Without the delay inlay hints aren't displayed at the very start
      vim.defer_fn(function()
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint.enable(mode == "n" or mode == "v", { bufnr = bufnr })
      end, 500)
    end

    vim.api.nvim_create_autocmd("InsertEnter", {
      group = inlay_hints_group,
      desc = "Enable inlay hints",
      buffer = bufnr,
      callback = function()
        if vim.g.inlay_hints then
          vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
        end
      end,
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
      group = inlay_hints_group,
      desc = "Disable inlay hints",
      buffer = bufnr,
      callback = function()
        if vim.g.inlay_hints then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end,
    })
  end

  -- Improve tailwind performance
  if client.name == "tailwindcss" then
    client.server_capabilities.completionProvider.triggerCharacters = { '"', "'", "`", ".", "(", "[", "!", "/", ":" }
  end

  -- Workaround for gopls not supporting semanticTokensProvider
  if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
    local semantic = client.config.capabilities.textDocument.semanticTokens
    client.server_capabilities.semanticTokensProvider = {
      full = true,
      legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
      range = true,
    }
  end
end

vim.diagnostic.config({
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = false,
  virtual_text = { spacing = 2 },
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

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover({
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.4),
  })
end

local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
  return signature_help({
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.4),
  })
end

-- Update mappings when registering dynamic capabilities
local register_capability = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then
    return
  end

  on_attach(client, vim.api.nvim_get_current_buf())

  return register_capability(err, res, ctx)
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure LSP keymaps",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    on_attach(client, args.buf)
  end,
})

-- Set up LSPs
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    local servers = vim
      .iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
      :map(function(file)
        return vim.fn.fnamemodify(file, ":t:r")
      end)
      :totable()
    vim.lsp.enable(servers)
  end,
})

-- HACK: Override buf_request to ignore notifications from LSP servers that don't implement a method.
local buf_request = vim.lsp.buf_request
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf_request = function(bufnr, method, params, handler)
  return buf_request(bufnr, method, params, handler, function() end)
end

return M
