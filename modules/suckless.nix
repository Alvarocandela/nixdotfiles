{ pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "alvarocandela";
          repo = "dwm";
          rev = "main";
          sha256 = "sha256-UJT6yrMc6rHX1RLMpZuOXRwU8vwtJYv5GC/nyjRnhN0="; # CHANGE THIS
        };
      });

      st = prev.st.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "alvarocandela";
          repo = "st";
          rev = "main";
          sha256 = "sha256-wohkmDsm26kqFGQKuY6NuBQsifT7nZNgrLqLFsU+Vog="; # CHANGE THIS
        };
        buildInputs = (old.buildInputs or []) ++ [ pkgs.harfbuzz pkgs.glib pkgs.gd ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [ dwm st ];
}
