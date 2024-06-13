local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)


lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "asm_lsp", -- ASM
        "clangd", -- C, C++
        "cmake", -- CMake
        "cssls", -- CSS
        "dockerls", -- Docker
        "docker_compose_language_service", -- Docker Compose
        "fortls", -- Fortran
        "golangci_lint_ls", -- GoLang
        "html", -- HTML
        "htmx", -- HTMX
        "hls", -- Haskell
        "jsonls", -- Json
        "jdtls", -- Java
        "tsserver", -- TypeScript
        "jinja_lsp", -- jinja
        "ltex", -- LaTeX
        "lua_ls", -- Lua
        "autotools_ls", -- Make
        "markdown_oxide", -- Markdown
        "nginx_language_server", -- NGINX
        "intelephense", -- PHP
        "perlnavigator", -- Perl
        "powershell_es", -- Powershell
        "ruff_lsp", "pyright", -- Python
        "basedpyright", -- Python
        "rust_analyzer", -- Rust
        "sqlls", -- SQL
        "somesass_ls", -- Sass
        "svelte", -- Svelte
        "taplo", -- TOML
        "tailwindcss", -- Tailwind CSS
        "biome", -- TypeScript
        "v_analyzer", -- V
        "lemminx", -- XML
        "gitlab_ci_ls", -- YAML
        "zls", -- zig
    },
    handlers = {
        function(server_name)
            xpcall(
            function() require('lspconfig')[server_name].setup({}) end,
            function() print("Server Failed to Load: ", server_name) end
            );
        end,
    },
})

local cmp = require("cmp")
cmp.setup({
    mapping = {
        ['<Enter>'] = cmp.mapping.confirm({select = false}),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    }
})
