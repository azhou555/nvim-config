return {
  -- Gutter signs, inline blame, hunk staging
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      signcolumn = true,
      current_line_blame = false,   -- toggle with <leader>gb
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
      },
      on_attach = function(buf)
        local gs = package.loaded.gitsigns
        local function map(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = buf, desc = "Git: " .. desc })
        end

        -- Hunk navigation
        map("n", "]h", function()
          if vim.wo.diff then return "]h" end
          vim.schedule(gs.next_hunk)
          return "<Ignore>"
        end, "Next hunk")
        map("n", "[h", function()
          if vim.wo.diff then return "[h" end
          vim.schedule(gs.prev_hunk)
          return "<Ignore>"
        end, "Prev hunk")

        -- Hunk actions
        map("n",  "<leader>ghs", gs.stage_hunk,                           "Stage hunk")
        map("n",  "<leader>ghr", gs.reset_hunk,                           "Reset hunk")
        map("v",  "<leader>ghs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk (visual)")
        map("v",  "<leader>ghr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk (visual)")
        map("n",  "<leader>ghS", gs.stage_buffer,                         "Stage buffer")
        map("n",  "<leader>ghu", gs.undo_stage_hunk,                      "Undo stage hunk")
        map("n",  "<leader>ghR", gs.reset_buffer,                         "Reset buffer")
        map("n",  "<leader>ghp", gs.preview_hunk,                         "Preview hunk")
        map("n",  "<leader>gb",  gs.toggle_current_line_blame,            "Toggle inline blame")
        map("n",  "<leader>ghd", gs.diffthis,                             "Diff this")
        map("n",  "<leader>ghD", function() gs.diffthis("~") end,         "Diff this (~)")

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<cr>", "Select hunk")
      end,
    },
  },

  -- Magit-style interactive git UI
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>",     desc = "Neogit status" },
      { "<leader>gS", "<cmd>Neogit kind=split<cr>", desc = "Neogit (split)" },
    },
    opts = {
      integrations = { diffview = true, fzf_lua = true },
      kind = "tab",
      commit_editor = { kind = "split" },
      signs = {
        hunk    = { "", "" },
        item    = { ">", "v" },
        section = { ">", "v" },
      },
    },
  },

  -- Side-by-side diff viewer and file history
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd",  "<cmd>DiffviewOpen<cr>",             desc = "Diffview open" },
      { "<leader>gD",  "<cmd>DiffviewClose<cr>",            desc = "Diffview close" },
      { "<leader>gFh", "<cmd>DiffviewFileHistory %<cr>",    desc = "File history (current)" },
      { "<leader>gFH", "<cmd>DiffviewFileHistory<cr>",      desc = "File history (all)" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default      = { layout = "diff2_horizontal" },
        merge_tool   = { layout = "diff3_horizontal", disable_diagnostics = true },
        file_history = { layout = "diff2_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = { flatten_dirs = true, folder_statuses = "only_folded" },
        win_config   = { position = "left", width = 35, win_opts = {} },
      },
    },
  },
}
