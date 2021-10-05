# nvim-vide(Developing)

learning operations please refer to [vim-vide](https://github.com/lzhnb/vim-vide)

## Installation
```
git clone -d 1 https://github.com/lzhnb/neovim-vide ~/.config/nvim
```

## Coc
Our installed coc list:
```sh
coc-git
coc-highlight
coc-snippets
coc-json
coc-explorer
coc-pyright
```

## Completion Operations
- `ctrl-n`: Next completion
- `ctrl-p`: Previou completion
- `ctrl-y`: Confirm completion

## Python Setting
Using `coc-pyright` to realize completion, and using `jedi-vim` to realize **go-to**.
We disable the autocompletion of `jedi-vim`.
- `<leader>d`: go to definition
- `K`: check documentation of class or method
- `<leader>n`: show the usage of a name in current file
- `<leader>r`: rename a name

TODO

