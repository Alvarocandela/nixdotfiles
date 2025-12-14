{ config, pkgs, ... }:

{
  # Enable VirtualBox
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true; # Essential for USB support
  };

  # Add user to the group automatically
  users.extraGroups.vboxusers.members = [ "alvaro" ];
}
