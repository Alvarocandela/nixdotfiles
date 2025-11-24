{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/suckless.nix
    
    # Import Specialisations
    ./specialisations/dev.nix
    ./specialisations/uni.nix
    ./specialisations/hack-rev.nix
    ./specialisations/hack-net.nix
  ];

  # --- Boot & Hardware ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_hardened;
  boot.supportedFilesystems = [ "btrfs" ];
  
  networking.hostName = "i-use-nixos-btw";

  networking.networkmanager.enable = true;
  programs.nix-ld.enable = true;

  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  # --- Locale & Time ---
  time.timeZone = "Europe/Madrid";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";

  # --- Services ---
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    xkb.layout = "es";
    windowManager.dwm.enable = true;
  };
  services.displayManager.ly.enable = true;
  
  services.pipewire = { enable = true; pulse.enable = true; };
  services.libinput.enable = true;
  programs.ssh.startAgent = true;

  # --- User ---
  users.users.alvaro = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  
  environment.systemPackages = with pkgs; [ wget git neovim tree asusctl ];
  programs.zsh.enable = true;
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  # --- Base Home Manager Config (Default Mode) ---
  home-manager.users.alvaro = {
    imports = [ ../modules/home/home.nix ];
    # This argument controls which Firefox profile is active
    _module.args.profileMode = "default";
  };
}
