# Install Packer

1. Clone
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Reopen Vim

3. Sync Packer
In Neovim run `:PackerSync`

4. Check terminal
On MacOs you may need to use a iterms instead of the default terminal because
of color support issues.

5. Install ripgrep
Live grep will not work unless installed.
```
cargo install ripgrep
```
