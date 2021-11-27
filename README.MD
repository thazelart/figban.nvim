# figban.nvim
This neovim plugin will help you easily create commented figlet banners to separate your code and configurations.

## Requirement
This plugin requires figlet to be installed.
<details>
  <summary>RedHat like</summary>

```bash
dnf install figlet
```
</details>

<details>
  <summary>Debian like</summary>

```sh
apt install figlet
```
</details>

<details>
  <summary>Arch</summary>

```sh
pacman -S figlet
```
</details>

## Installation
<details>
  <summary>Vim Plug</summary>

#### [Vim-Plug](https://github.com/junegunn/vim-plug)

1. Add `Plug 'thazelart/figban.nvim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:PlugInstall`

</details>

<details>
  <summary>Dein.vim</summary>

#### [Dein.vim](https://github.com/Shougo/dein.vim)

1. Add `call dein#add('thazelart/figban.nvim')` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:call dein#install()`

</details>

<details>
  <summary>Vundle</summary>

#### [Vundle](https://github.com/VundleVim/Vundle.vim) or similar

1. Add `Plugin 'thazelart/figban.nvim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:BundleInstall`

</details>

## Configuration
You can choose you figlet `fontstyle` by adding this config in your vimrc
```vim
let g:figban_fontstyle='shadow'
```

## command
Generate your banner
```sh
:Figban My banner
```

#### Examples
<details>
  <summary>Golang</summary>

```go
/**  __  __         ____
 *  |  \/  |_   _  | __ )  __ _ _ __  _ __   ___ _ __
 *  | |\/| | | | | |  _ \ / _` | '_ \| '_ \ / _ \ '__|
 *  | |  | | |_| | | |_) | (_| | | | | | | |  __/ |
 *  |_|  |_|\__, | |____/ \__,_|_| |_|_| |_|\___|_|
 *          |___/
**/
```
</details>

<details>
  <summary>Python</summary>

```python
"""  __  __         ____
    |  \/  |_   _  | __ )  __ _ _ __  _ __   ___ _ __
    | |\/| | | | | |  _ \ / _` | '_ \| '_ \ / _ \ '__|
    | |  | | |_| | | |_) | (_| | | | | | | |  __/ |
    |_|  |_|\__, | |____/ \__,_|_| |_|_| |_|\___|_|
            |___/
"""
```
</details>

<details>
  <summary>Bash</summary>

```sh
#  __  __         ____
# |  \/  |_   _  | __ )  __ _ _ __  _ __   ___ _ __
# | |\/| | | | | |  _ \ / _` | '_ \| '_ \ / _ \ '__|
# | |  | | |_| | | |_) | (_| | | | | | | |  __/ |
# |_|  |_|\__, | |____/ \__,_|_| |_|_| |_|\___|_|
#         |___/
#
```
</details>

<details>
  <summary>Lua</summary>

```lua
--[[  __  __         ____
--   |  \/  |_   _  | __ )  __ _ _ __  _ __   ___ _ __
--   | |\/| | | | | |  _ \ / _` | '_ \| '_ \ / _ \ '__|
--   | |  | | |_| | | |_) | (_| | | | | | | |  __/ |
--   |_|  |_|\__, | |____/ \__,_|_| |_|_| |_|\___|_|
--           |___/
--]]
```
</details>

