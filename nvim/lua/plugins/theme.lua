return {
    {
        "folke/tokyonight.nvim", -- Plugin repository
        config = function()
            -- Setup function where you configure the theme
            require("tokyonight").setup({
                style = "storm",  -- The theme comes in four styles: "storm", "moon", "night", and "day".
                transparent = true,  -- Enable this to disable setting the background color.
                terminal_colors = true,  -- Configure the colors used when opening a `:terminal` in Neovim.

                -- Additional stylings
                styles = {
                    comments = { italic = false },  -- Remove italic style from comments
                    keywords = { italic = false },  -- Remove italic style from keywords
                    sidebars = "dark",  -- Style for sidebars, can be "dark", "transparent", or "normal"
                    floats = "dark",  -- Style for floating windows, can be "dark", "transparent", or "normal"
                },
            })

            -- After setting up the theme, set it as the current color scheme
            vim.cmd[[colorscheme tokyonight]]
        end
    }
}

