{ config, pkgs, ... }:

{
  # 1. Enable Emacs
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30; # Doom recommends Emacs 29+
  };

  # 2. Install Doom Dependencies
  # Doom expects these tools to be present in your system
  home.packages = with pkgs; [
    git
    ripgrep  # Essential for fast search (grep)
    fd       # Essential for fast file finding
    
    # Optional but highly recommended for Doom modules:
    clang    # C/C++ completion
    shellcheck # Shell script linting
    shfmt      # Shell script formatting
    aspell   # Spellcheck (optional)
    aspellDicts.en
    aspellDicts.es
    nodejs
  ];

  # 3. Add Doom to your PATH
  # This allows you to run 'doom sync', 'doom doctor', etc.
  home.sessionPath = [
    "/home/alvaro/.dots/config/emacs/bin"
  ];
}
