{ config, pkgs, lib, ... }:

{
  specialisation.dev.configuration = {
    system.nixos.tags = [ "dev" ];
    
    # System-wide dev packages
    environment.systemPackages = with pkgs;[ 
    gcc
    rustup
    rust-analyzer
    go
    ];

    home-manager.users.alvaro = {
      _module.args.profileMode = lib.mkForce "dev";

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
