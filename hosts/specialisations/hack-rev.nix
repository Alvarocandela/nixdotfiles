{ config, pkgs, lib, ... }:
{
  specialisation.hack-rev.configuration = {
    system.nixos.tags = [ "hack-rev" ];
    environment.systemPackages = with pkgs; [
      gcc
      detect-it-easy
      ghidra
      radare2
      binwalk
    ];

    home-manager.users.alvaro = {
      _module.args.profileMode = lib.mkForce "hack-rev";
    };
  };
}
