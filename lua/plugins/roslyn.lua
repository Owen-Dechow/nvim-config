return {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    config = function()
        vim.lsp.config("roslyn", {
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                },
                ["csharp|code_lens"] = {
                    dotnet_enable_references_code_lens = true,
                },
                ["dotnet_diagnostic.IDE0001.severity"] = "silent",
            },
        })
    end,
}
