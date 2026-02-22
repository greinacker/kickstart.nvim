return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [d]iff view' },
      { '<leader>gD', '<cmd>DiffviewClose<CR>', desc = '[G]it close [D]iff view' },
      { '<leader>gf', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it [f]ile history' },
      { '<leader>gF', '<cmd>DiffviewFileHistory<CR>', desc = '[G]it repo [F]ile history' },
    },
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,
      view = {
        default = {
          layout = 'diff2_horizontal',
        },
        merge_tool = {
          layout = 'diff3_horizontal',
        },
      },
      file_panel = {
        listing_style = 'tree',
      },
    },
  },
}
