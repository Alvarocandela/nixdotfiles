{ config, pkgs, lib, profileMode, ... }:

let
    dotfiles = "${config.home.homeDirectory}/.dots/config";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
        picom = "picom";
        nvim = "nvim";
        zathura = "zathura";
    };
in
{
    imports = [
        ./neovim.nix
        ./firefox.nix
        ./zsh.nix
        ./emacs.nix
    ];

    home.username = "alvaro";
    home.homeDirectory = "/home/alvaro";
    home.stateVersion = "25.05";

    # Dynamic Profile File
    home.file.".config/current-firefox-profile".text = profileMode;

    # Dotfiles Symlinks
    xdg.configFile = builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
    }) configs;

    programs.git = {
        enable = true;
        userName = "Álvaro Candela";
        userEmail = "alvarocandela47@gmail.com";
    };

    nixGL.vulkan.enable = true;

    home.packages = with pkgs; [
        home-manager
        python3
        picom
        unzip
        superfile
        pavucontrol
        feh
        brightnessctl
        zathura
        lsd
        bat
        ripgrep fd fzf lazygit # Moved from neovim.nix to general tools
    ];
}
