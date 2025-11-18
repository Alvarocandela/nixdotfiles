{ pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "alvarocandela";
          repo = "dwm";
          rev = "main";
          sha256 = "sha256-unlg4vhpVwA+HV/qtzPAJjiXvDgG8hgL56NqmpRid3k="; # CHANGE THIS
        };
      });

      st = prev.st.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "alvarocandela";
          repo = "st";
          rev = "main";
          sha256 = "sha256-2s32RDnhI/qr1VrQWqPn5x7lx/0Ub9ko7Gw7+oMfizc="; # CHANGE THIS
        };
        buildInputs = (old.buildInputs or []) ++ [ pkgs.harfbuzz pkgs.glib pkgs.gd ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [ dwm st ];
}
