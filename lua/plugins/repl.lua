return {
    "petrichorma/nvim_ds_repl",
    dependencies = "nvim-treesitter",
    ft = {"python", "lua"}, 
    config = function()
        require("nvim-python-repl").setup({
            execute_on_send = true,
            vsplit = true,
        })
    end
    }

