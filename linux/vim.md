# Here I keep notes on using vim.

## Small notes
:w	write the current buffer to file
:bd	close the currently open buffer

## Add the following lines to get relative line number
set number
set relativenumber

## Markdown and folding
Vim now supports markdown and folding but you have to add the below line to `.vimrc`
`let g:markdown_folding = 1`

The following commnad help to manipulate the folding
- 'zr': reduces fold level throughout the buffer
- 'zR': opens all folds
- 'zm': increases fold level throughout the buffer
- 'zM': folds everything all the way
- 'za': open a fold your cursor is on
- 'zA': open a fold your cursor is on recursively
- 'zc': close a fold your cursor is on
- 'zC': close a fold your cursor is on recursively



Try ':help fold-expr' and ':help fold-commands' for details.


# Useful Refernces
## Books (Online)
- [Learn Vim (the Smart Way)](https://github.com/iggredible/Learn-Vim)
- [How to Learn Vim in 2020](https://dev.to/iggredible/learning-vim-in-2020-1mma)

## Some awesome videos on Vim!
- [Mastering the Vim Language](https://www.youtube.com/watch?v=wlR5gYd6um0)
- [How to Do 90% of What Plugins Do (With Just Vim)](https://www.youtube.com/watch?v=XA2WjJbmmoM)


