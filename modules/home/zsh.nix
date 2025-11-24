{ config, pkgs, lib, profileMode, ...}:

programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "command-not-found"
        "history-substring-search"
      ];
    };
    initContent = lib.mkOrder 1200 '''
      echo "Hello zsh initContent!"
    ''';
    shellAliases = {
      ls = lsd;
      cat = bat;
      spotx = "bash <(curl -sSL https://spotx.official.github.io/run.sh) -i";
      nix-spec = "sudo nixos-rebuild switch --flake ~/.dots#i-use-nixos-btw --specialisation";
      nix-update = "sudo nixos-rebuild switch --flake ~/.dots#i-use-nixos-btw";
    };
};
