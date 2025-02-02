require("mason").setup()
require("mason-lspconfig").setup ({
    ensure_installed = { "lua_ls", "clangd", "cmake" },
})

 -- local capabilities = require('cmp_nvim_lsp').default_capabilities()

  local servers ={'clangd'}
require("lspconfig").clangd.setup {
    capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {}
require("lspconfig").cmake.setup {}


-- Configure your LSP server with code action keybinding
require('lspconfig').clangd.setup{
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    -- Set keybinding for code actions (e.g., <leader>a)
    vim.keymap.set('n', '<SPACE>t', vim.lsp.buf.code_action, opts)
  end
}

vim.g.completion_chain_complete_list = {
    default = {
        default = {
            {complete_items = {'lsp'}},
            {complete_items = {'buffers'}}
        },
        tex = {
            {complete_items = {'vimtex', 'lsp'}}
        },
        comment = {
            {complete_items = {'buffers'}}
        },
        string = {
            {complete_items = {'path'}}
        },
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}

require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities,
}


vim.o.completeopt = "menuone,noselect"


require'cmp'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  window ={
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };
  };
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
