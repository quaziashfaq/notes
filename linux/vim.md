# Here I keep notes on using vim.

## Small notes
:w	        write the current buffer to file
:bd[elete]	close the currently open buffer

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
- 'za': toggle (open if closed or close if opened) a fold your cursor is on
- 'zA': toggle (open if closed or close if opened) a fold your cursor is on recursively
- 'zc': close a fold your cursor is on
- 'zC': close a fold your cursor is on recursively
- 'zo': open a fold your cursor is on
- 'zO': open a fold your cursor is on recursively



Try ':help fold-expr' and ':help fold-commands' for details.


# Useful Refernces
## Books (Online)
- [Learn Vim (the Smart Way)](https://github.com/iggredible/Learn-Vim)
- [How to Learn Vim in 2020](https://dev.to/iggredible/learning-vim-in-2020-1mma)

## Some awesome videos on Vim!
- [Mastering the Vim Language](https://www.youtube.com/watch?v=wlR5gYd6um0)
- [How to Do 90% of What Plugins Do (With Just Vim)](https://www.youtube.com/watch?v=XA2WjJbmmoM)


# Miscellenous

w - go to the beginning of the next word
e - go to the end of the word or next word
b - go to the beginning of the previous word

3igo<enter> - Print 'go' 3 times

fo = find next 'o' from the cursor in the current line only.

F

% - find the matching paranthesis

* - find the word under cursor (forward search)
\# - find the word under cursor (backward search

gg - go to the beginning of the file.
G - go to the end of the file
2G - go to the 2nd line.

x - delete the letter under cursor
X = delete the letter to the left of the cursor

H - move the cursor to the top line of the screen
M - move the cursor to the middle line of the screen
L - move the cursor to the last line of the screen

Pressing z and then return will move the current line to the top of the screen. A number will move that line number to the top of the screen, so pressing 50z and then return will make the top of the screen start at line 50.

# Plugins
- Searching: https://github.com/ggreer/the_silver_searcher
- Project: 
    - https://vimawesome.com/plugin/project-vim
    - https://github.com/amiorin/vim-project




