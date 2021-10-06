# nvim-vide(Developing)

learning operations please refer to [vim-vide](https://github.com/lzhnb/vim-vide)

## Installation
```
git clone --depth 1 https://github.com/lzhnb/neovim-vide ~/.config/nvim
```

## Vim Operation
- run `vimtutor` in terminal to learn the base operation
- run `:h` in `vim/neovim` to refer the document of `vim/neovim`

### cursor goto(Normal mode)
| hot key    | function                           |
| ---------- | ---------------------------------- |
| `g`        | First line                         |
| `G`        | Last line                          |
| `:n`       | `n`-th line                        |
| `n`        | `n`-th line after the current line |
| `0`/`|`    | head of the current line           |
| `$`        | tail of the current line           |
| `n|`/`0nl` | `n`-column of the current line     |

### Copy/Paste
| hot key  | function                     |
| -------- | ---------------------------- |
| `yy`     | copy the current line        |
| `dd`     | cut the current line         |
| `p`      | paste under the current line |
| `P`      | paste upper the current line |
| `x`      | cut the selection            |

### Undo/Redo
| hot key  | function     |
| -------- | ------------ |
| `u`      | Undo         |
| `ctrl+r` | Redo         |

### Replace
`:[addr]s/src/tar/[option]`
- `src` string to be replaced
- `tar` string to replace
- `addr` searching scope:
	- `n,m`: from `n`-th to `m`-th line
	- `%`: current file globally
	- `.,$`: from the current to the last line
- `option` operation mode
	- `g` global replace
	- `c` confirm one by one
	- `p` indicates that the replacement displayed line by line (`Ctrl+l` cover)

Commonly used global replacement `:%s/src/tar/g`

### Visual mode
we press **ctrl-v** and enter the `Visual` mode, then choose multiple lines(`gg` to the first line，`G` to the last line):
- press `I` and then enter the **Insert** mode, enter `Esc` after finishing editing, the edited content will appear in the selected lines.
- press `c` and then enter the `Replace` mode, enter `Esc` after replacement, the replacement will be applied to the selected lines. 
- press `d` and delete the selected content.
- press `<` to indent forward `Tab`, press to indent backward `Tab`.

### Folding

| hot key                 | function           |
| ----------------------- | ------------------ |
| `zf`                    | create folding     |
| `zo`                    | open folding       |
| `zc`                    | close folding      |
| `:mkview` / `:loadview` | save and load view |

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

## hot key setting
| hot key  | function                               |
| -------- | -------------------------------------- |
| `ctrl+j` | switch to the previous buffer          |
| `ctrl+k` | switch to the next buffer              |
| `ctrl+d` | exit opening file and close buffer     |
| `F3`     | switch highlight search                |
| `F4`     | switch paste mode (deprecated feature) |

## Plugins setting

### nvim-comment
| hot key | function                                    |
| ------- | ------------------------------------------- |
| `gcc`   | comment/uncomment current line(Normal mode) |
| `gc`    | comment/uncomment selection (Visual mode)   |
| `gcip`  | comment/uncomment a paragraph               |

TODO

