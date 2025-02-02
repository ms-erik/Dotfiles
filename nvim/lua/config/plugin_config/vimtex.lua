-- Isso é necessário para o VimTeX carregar corretamente. O "indent" é opcional.
-- Note que a maioria dos gerenciadores de plugins fará isso automaticamente.
vim.cmd('filetype plugin indent on')

-- Isso habilita os recursos relacionados à sintaxe do Vim e do Neovim. Sem isso, alguns recursos do VimTeX não funcionarão.
vim.cmd('syntax enable')

-- Opções do visualizador: você pode configurar o visualizador especificando um método de visualização integrado:
vim.g.vimtex_view_method = 'zathura'

-- Ou com uma interface genérica:
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexrun'
vim.maplocalleader = ','

-- O VimTeX usa o latexmk como o backend de compilador padrão. Se você o usar, o que é altamente recomendado, provavelmente não precisará configurar nada. Se você deseja usar outro backend de compilador, pode alterá-lo da seguinte forma.
--vim.g.vimtex_compiler_method = 'latexrun'

--vim.g.maplocalleader = '\'
