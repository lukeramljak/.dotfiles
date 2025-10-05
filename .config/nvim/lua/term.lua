local M = {}

local floating_window_scaling_factor = 0.8

local function get_window_pos()
  local height = math.ceil(vim.o.lines * floating_window_scaling_factor) - 1
  local width = math.ceil(vim.o.columns * floating_window_scaling_factor)
  local row = math.ceil(vim.o.lines - height) / 2
  local col = math.ceil(vim.o.columns - width) / 2
  return width, height, row, col
end

local function create_float_buf()
  return vim.api.nvim_create_buf(false, true)
end

---@param buf integer
local function open_floating_window(buf)
  local width, height, row, col = get_window_pos()

  return vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
  })
end

---@param float_win integer
local function setup_resize_autocmd(float_win)
  vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
      vim.defer_fn(function()
        if not vim.api.nvim_win_is_valid(float_win) then
          return
        end

        local new_width, new_height, new_row, new_col = get_window_pos()

        vim.api.nvim_win_set_config(float_win, {
          relative = "editor",
          width = new_width,
          height = new_height,
          row = new_row,
          col = new_col,
        })
      end, 20)
    end,
  })
end

---@param buf integer
local function setup_termclose_autocmd(buf)
  vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(buf) then
          vim.api.nvim_buf_delete(buf, { force = true })
        end
      end)
    end,
  })
end

local function create_window()
  local buf = create_float_buf()
  local float_win = open_floating_window(buf)

  setup_resize_autocmd(float_win)
  setup_termclose_autocmd(buf)
end

---@param cmd string
function M.open(cmd)
  create_window()
  vim.cmd.term(cmd or "")
  vim.cmd.startinsert()
end

return M
