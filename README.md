# Neovim_Setup_for_Data_Science
## Setup Neovim as an IDE to work with R, Python, Julia for Data Science
* Download Neovim from https://github.com/neovim/neovim.
* Intall vim-plug(https://github.com/junegunn/vim-plug) or simply copy and paste the below commands in your terminal.
```
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
```

* You can simply download this folder and put it in the path "c:/Users/username/AppData/Local/nvim/plugged" for Windows or "~/.local/share/nvim/site/plugged" for Linux.

# Preview
## Startup Page preview using Nvim Dashboard
![Screenshot 2021-10-09 013254](https://user-images.githubusercontent.com/42490023/136674340-d84f3637-84c4-4d66-a1cf-65b776072e90.jpg)
## A Preview of Telescope
![Screenshot 2021-10-09 013325](https://user-images.githubusercontent.com/42490023/136619002-135efe16-4bbc-40cc-896d-744fb85f1bf9.jpg)
## A preview of NERDTree and Nvim-R
![testR](https://user-images.githubusercontent.com/42490023/135729956-18db7c28-9cd5-40bf-a91a-9662fc091268.jpg)

# Features
* Active theme is https://github.com/tomasr/molokai.
* Custom Startup page with https://github.com/mhinz/vim-startify.
* Better icons from https://github.com/ryanoasis/vim-devicons.
* A light and configurable statusline/tabline plugin by https://github.com/vim-airline/vim-airline.
* File Explorer used is https://github.com/preservim/nerdtree.
* NeoVim Lisp configuration with https://github.com/neovim/nvim-lspconfig.
* Github integration with https://github.com/tpope/vim-fugitive.
* R integration with https://github.com/jalvesaq/Nvim-R.
* Julia integration with https://github.com/JuliaEditorSupport/julia-vim.
* Commenter used is https://github.com/preservim/nerdcommenter.
* Sysntax highlighting by https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.
* command-line file finder with fzf https://github.com/junegunn/fzf.vim.
* Integration of Neovim LSP client and fzf with https://github.com/junegunn/fzf.vim.
* Terminal used in the nvim for Python and Julia is https://github.com/kassio/neoterm. 
