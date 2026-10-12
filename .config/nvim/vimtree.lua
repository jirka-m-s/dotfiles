-- Vypnutí netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- Nastavení nvim-tree
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
})

-- Klávesová zkratka: Ctrl + n otevře/zavře strom
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

-- Automatické otevření nvim-tree po startu
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    local is_directory = vim.fn.isdirectory(data.file) == 1

    if is_directory then
      -- Při otevření složky změníme adresář a otevřeme nvim-tree
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    else
      -- Při otevření souboru otevřeme nvim-tree a vrátíme fokus do souboru
      require("nvim-tree.api").tree.open()
      pcall(vim.cmd, "wincmd p")
    end
  end,
})

-- Bezpečné automatické zavření nvim-tree před ukončením
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") then
        table.insert(invalid_win, w)
      end
    end
    if #wins - #invalid_win == 1 then
      for _, w in ipairs(invalid_win) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})
