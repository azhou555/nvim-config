return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>",              desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>",          desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>",            desc = "Buffers" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",           desc = "Recent files" },
      { "<leader>fs", "<cmd>FzfLua grep_cword<cr>",         desc = "Grep word under cursor" },
      { "<leader>fS", "<cmd>FzfLua grep_cWORD<cr>",         desc = "Grep WORD under cursor" },
      { "<leader>f/", "<cmd>FzfLua blines<cr>",             desc = "Search in buffer" },
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>",          desc = "Help tags" },
      { "<leader>fk", "<cmd>FzfLua keymaps<cr>",            desc = "Keymaps" },
      { "<leader>fc", "<cmd>FzfLua commands<cr>",           desc = "Commands" },
      { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document diagnostics" },
      { "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
      { "<leader>ft", "<cmd>FzfLua treesitter<cr>",         desc = "Treesitter symbols" },
      { "<leader>fq", "<cmd>FzfLua quickfix<cr>",           desc = "Quickfix list" },
      { "<leader>fm", "<cmd>FzfLua marks<cr>",              desc = "Marks" },
      { "<leader>fj", "<cmd>FzfLua jumps<cr>",              desc = "Jump list" },
      -- Git
      { "<leader>gf", "<cmd>FzfLua git_files<cr>",          desc = "Git files" },
      { "<leader>gB", "<cmd>FzfLua git_branches<cr>",       desc = "Git branches" },
      { "<leader>gc", "<cmd>FzfLua git_commits<cr>",        desc = "Git commits" },
      { "<leader>gC", "<cmd>FzfLua git_bcommits<cr>",       desc = "Git buffer commits" },
    },
    opts = {
      "telescope",  -- use telescope-style layout as default profile
      winopts = {
        height = 0.85,
        width  = 0.85,
        row    = 0.35,
        col    = 0.50,
        border = "rounded",
        preview = {
          border     = "border",
          scrollbar  = "float",
          layout     = "flex",
          flip_cols  = 130,
          title      = true,
          delay      = 100,
        },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
        ["--info"]   = "inline",
      },
      files = {
        git_icons = true,
        file_icons = true,
        color_icons = true,
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always "
          .. "--smart-case --max-columns=4096 -e",
      },
    },
  },
}
