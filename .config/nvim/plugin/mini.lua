require("mini.ai").setup()
require("mini.bufremove").setup()
local miniclue = require("mini.clue")
miniclue.setup({
  triggers = {
    -- Builtins
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "`" },
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },
    { mode = "n", keys = "<C-w>" },
    { mode = "i", keys = "<C-x>" },
    { mode = "n", keys = "z" },
    -- Leader triggers
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },
    -- Moving between stuff
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
  },
  clues = {
    -- Leader/movement groups
    { mode = "n", keys = "<leader>b", desc = "+buffers" },
    { mode = "n", keys = "<leader>c", desc = "+code" },
    { mode = "x", keys = "<leader>c", desc = "+code" },
    { mode = "n", keys = "<leader>f", desc = "+find" },
    { mode = "x", keys = "<leader>f", desc = "+find" },
    { mode = "n", keys = "<leader>g", desc = "+git" },
    { mode = "n", keys = "<leader>p", desc = "+package manager" },
    { mode = "n", keys = "<leader>x", desc = "+loclist/quickfix" },
    { mode = "n", keys = "[", desc = "+prev" },
    { mode = "n", keys = "]", desc = "+next" },
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
  window = {
    delay = 500,
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
    config = function(bufnr)
      local max_width = 0
      for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
        max_width = math.max(max_width, vim.fn.strchars(line))
      end

      -- Keep some right padding
      max_width = max_width + 2

      return {
        -- Dynamic width capped at 70
        width = math.min(70, max_width),
      }
    end,
  },
})
require("mini.files").setup({
  mappings = {
    show_help = "?",
    go_in_plus = "<cr>",
    go_out_plus = "<tab>",
  },
})
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()

vim.notify = MiniNotify.make_notify()

vim.keymap.set("n", "<leader>bd", function()
  MiniBufremove.delete(0, false)
end, { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>e", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.fnamemodify(bufname, ":p")

  -- Noop if the buffer isn't valid
  if path and vim.uv.fs_stat(path) then
    MiniFiles.open(bufname, false)
  end
end, { desc = "File explorer" })

vim.api.nvim_create_autocmd("User", {
  desc = "Notify LSPs that a file was renamed",
  pattern = { "MiniFilesActionRename", "MiniFilesActionMove" },
  callback = function(args)
    local changes = {
      files = {
        {
          oldUri = vim.uri_from_fname(args.data.from),
          newUri = vim.uri_from_fname(args.data.to),
        },
      },
    }
    local will_rename_method, did_rename_method = "workspace/willRenameFiles", "workspace/didRenameFiles"
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
      if client:supports_method(will_rename_method) then
        local res = client:request_sync(will_rename_method, changes, 1000, 0)
        if res and res.result then
          vim.lsp.util.apply_workspace_edit(res.result, client.offset_encoding)
        end
      end
    end

    for _, client in ipairs(clients) do
      if client:supports_method(did_rename_method) then
        client:notify(did_rename_method, changes)
      end
    end
  end,
})
