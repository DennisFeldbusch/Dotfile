local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup_nvim_cmp({
    sources = {
        {name = 'omni', trigger_characters = {'\\','{'} },
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
                buffer = "[Buffer]",
                -- formatting for other sources
            })[entry.source.name]
            return vim_item
        end,
    },
    view = {
		entries = "native",
	},
    sorting = {
		priority_weight = 2,
	},

})

lsp.setup()
