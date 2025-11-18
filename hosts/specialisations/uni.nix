{ config, pkgs, lib, ... }:
{
  specialisation.uni.configuration = {
    system.nixos.tags = [ "uni" ];
    environment.systemPackages = with pkgs; [
    	libreoffice
    ];

    home-manager.users.alvaro = {
      _module.args.profileMode = lib.mkForce "uni";
      # Add Uni-specific home packages
      home.packages = [ 
        
      ];
    };
  };
}
