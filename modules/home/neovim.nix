{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
    stylua
    ruff
    shfmt
    fzf
    ast-grep
    luarocks
  ];
}
