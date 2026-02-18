-- Buffer line (tabs for open buffers)
-- https://github.com/akinsho/bufferline.nvim

return {
  'akinsho/bufferline.nvim',
  version = '*',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    -- Always show the tabline row so bufferline can render immediately.
    vim.opt.showtabline = 2
  end,
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'neo-tree',
          text = '',
          separator = true,
        },
      },
    },
  },
  keys = {
    { '[b', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev [B]uffer' },
    { ']b', '<cmd>BufferLineCycleNext<CR>', desc = 'Next [B]uffer' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<CR>', desc = '[B]uffer [P]in' },
    {
      '<leader>bc',
      function()
        local current = vim.api.nvim_get_current_buf()

        -- Only close real, listed buffers (skip sidebars/special buffers).
        if not vim.bo[current].buflisted then return end

        local listed = vim.fn.getbufinfo { buflisted = 1 }
        if #listed > 1 then
          vim.cmd 'BufferLineCycleNext'
        else
          vim.cmd 'enew'
        end

        if vim.api.nvim_buf_is_valid(current) then
          vim.cmd('silent! bdelete ' .. current)
        end
      end,
      desc = '[B]uffer [C]lose -> next',
    },
  },
}
