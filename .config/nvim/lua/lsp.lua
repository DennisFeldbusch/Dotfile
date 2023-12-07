local keymappings = require("lsp-keys")


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
        },
    },
})

require("mason-tool-installer").setup {
  auto_update = false,
  run_on_start = true,
}

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local lspkind = require("lspkind")
lspkind.init({
	symbol_map = {
        Copilot = "[]",
		Text = "[]",
		Method = "[]",
		Function = "[]",
		Constructor = "[]",
		Field = "[ﰠ]",
		Variable = "[]",
		Class = "[ﴯ]",
		Interface = "[]",
		Module = "[]",
		Property = "[ﰠ]",
		Unit = "[塞]",
		Value = "[]",
		Enum = "[]",
		Keyword = "[]",
		Snippet = "[]",
		Color = "[]",
		File = "[]",
		Reference = "[]",
		Folder = "[]",
		EnumMember = "[]",
		Constant = "[]",
		Struct = "[פּ]",
		Event = "[]",
		Operator = "[]",
		TypeParameter = "",
	},
})

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( "confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup({
    window = {
        completion = {
            winhighlight = "Normal:WildMenu",
        },
        documentation = {
            winhighlight = "Normal:TermCursor,FloatBorder:TermCursor",
        }
    },

    sources = {
        {name = 'copilot'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lsp_signature_help'},
        {name = 'vimtex', option = {
                info_in_menu = 1,
                info_in_window = 1,
                match_against_description = 1,
                symbols_in_menu = 1,
            },
        },
        {name = 'path'},
        {name = 'buffer', keyword_length = 3},
    },
    completion = {
        completeopt = table.concat(vim.opt.completeopt:get(), ","),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
    }),
    formatting = {
        format = lspkind.cmp_format({
			maxwidth = 50,
		}),
    },
    view = {
        entries = "custom",
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

-- c++
require("lspconfig").clangd.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
		keymappings.keys(client, bufnr)
	end,
})

-- go
require("lspconfig").gopls.setup({
	on_attach = function(client, bufnr)
		keymappings.keys(client, bufnr)
	end,
})

--java
require("lspconfig").jdtls.setup({
    on_attach = function(client, bufnr)
        keymappings.keys(client, bufnr)
    end,
})

--python
require("lspconfig").pyright.setup({
    on_attach = function(client, bufnr)
        keymappings.keys(client, bufnr)
    end,
    settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},

	flags = {
		debounce_text_changes = 150,
	},
})

--terraform
require("lspconfig").terraformls.setup({
    on_attach = function(client, bufnr)
        keymappings.keys(client, bufnr)
    end,
})

-- latex
require("lspconfig").ltex.setup({
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown", },
            language = "en-US",
            diagnosticSeverity = {
                PASSIVE_VOICE = "warning",
                default = "information"
            },
            sentenceCacheSize = 2000,
            additionalRules = {
                enablePickyRules = true,
            },
            dictionary = {
            ["en-US"] = {"fuzzer","fuzzers", "JQF", "bytecode"}
        }
    },
},
on_attach = function(client, bufnr)
    keymappings.keys(client, bufnr)
end,
})
