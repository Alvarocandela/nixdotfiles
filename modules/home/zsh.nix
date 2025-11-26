{ config, pkgs, lib, profileMode, ...}:

{

programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "history-substring-search"
      ];
    };
    initContent = lib.mkOrder 1200 ''
      bindkey '^?'      backward-delete-char          # bs         delete one char backward
      bindkey '^[[3~'   delete-char                   # delete     delete one char forward
      bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
      bindkey '^[[F'    end-of-line                   # end        go to the end of line
      bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
      bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
      bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
      bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
      bindkey '^[[D'    backward-char                 # left       move cursor one char backward
      bindkey '^[[C'    forward-char                  # right      move cursor one char forward
      bindkey '^[[A'    up-line-or-beginning-search   # up         prev command in history
      bindkey '^[[B'    down-line-or-beginning-search # down       next command in history
    '';
    shellAliases = {
      ls = "lsd";
      cat = "bat";
      spotx = "bash <(curl -sSL https://spotx.official.github.io/run.sh) -i";
      nix-spec = "sudo nixos-rebuild switch --flake ~/.dots#i-use-nixos-btw --specialisation";
      nix-update = "sudo nixos-rebuild switch --flake ~/.dots#i-use-nixos-btw";
    };
};

}
