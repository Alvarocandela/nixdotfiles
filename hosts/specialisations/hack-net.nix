{ config, pkgs, lib, ... }:
{
  specialisation.hack-net.configuration = {
    system.nixos.tags = [ "hack-net" ];
    environment.systemPackages = with pkgs; [
      wireshark
      burpsuite
    ];

    home-manager.users.alvaro = {
      _module.args.profileMode = lib.mkForce "hack-net";
    };
  };
}
