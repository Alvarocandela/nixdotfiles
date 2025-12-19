{ config, pkgs, lib, ... }:

{
  specialisation.dev.configuration = {
    system.nixos.tags = [ "dev" ];

    imports = [
      ../../modules/home/emacs.nix
    ];
    
    # System-wide dev packages
    environment.systemPackages = with pkgs;[ 
    gcc
    ];

    home-manager.users.alvaro = {
      # 1. Tell home-manager we are in "dev" mode (for Firefox, etc.)
      _module.args.profileMode = lib.mkForce "dev";

      # 2. Porting your Zed Editor config here so it ONLY exists in Dev mode
      programs.zed-editor = {
        enable = true;
        userSettings = {
          assistant = {
            enabled = true;
            default_model = {
              provider = "zed.dev";
              model = "claude-4-5-sonnet";
            };
            version = "2";
          };
          hour_format = "hour24";
          auto_update = false;
          env = { TERM = "xterm-256color"; };
          shell = { program = "bash"; };
          vim_mode = true;
          theme = {
            mode = "dark";
            light = "One Light";
            dark = "One Dark";
          };
        };
      };
    };
  };
}
