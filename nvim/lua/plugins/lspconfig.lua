return {
	  {
	    'williamboman/mason.nvim',
	    lazy = false,
	    opts = {},
	  },
	  -- Autocompletion
	  {
	    'hrsh7th/nvim-cmp',
	    event = 'InsertEnter',
	    config = function()
	      local cmp = require('cmp')

	      cmp.setup({
		sources = {
		  {name = 'nvim_lsp'},
		},
		mapping = cmp.mapping.preset.insert({
		  ['<C-Space>'] = cmp.mapping.complete(),
		  ['<CR>'] = cmp.mapping.confirm({ select = true }),
		  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
		  ['<C-d>'] = cmp.mapping.scroll_docs(4),
		}),
		snippet = {
		  expand = function(args)
		    vim.snippet.expand(args.body)
		  end,
		},
	      })
	    end
	  },

	  -- LSP
	  {
	    'neovim/nvim-lspconfig',
	    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
	    event = {'BufReadPre', 'BufNewFile'},
	    dependencies = {
	      {'hrsh7th/cmp-nvim-lsp'},
	      {'williamboman/mason.nvim'},
	      {'williamboman/mason-lspconfig.nvim'},
	    },
	    init = function()
	      -- Reserve a space in the gutter
	      -- This will avoid an annoying layout shift in the screen
	      vim.opt.signcolumn = 'yes'
	    end,
	    config = function()
	      local lsp_defaults = require('lspconfig').util.default_config

	      -- Add cmp_nvim_lsp capabilities settings to lspconfig
	      -- This should be executed before you configure any language server
	      lsp_defaults.capabilities = vim.tbl_deep_extend(
		'force',
		lsp_defaults.capabilities,
		require('cmp_nvim_lsp').default_capabilities()
	      )
	      end
      }
}
