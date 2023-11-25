return {
    {
        'navarasu/onedark.nvim',
        as = 'onedark',
        config = function()
            vim.cmd('colorscheme onedark')
        end
    },
   'nvim-treesitter/playground',
   'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
}
