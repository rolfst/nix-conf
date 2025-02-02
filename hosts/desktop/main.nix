{ config, pkgs, lib, ... }:

{
  imports = [
    ./brightness.nix
    # ./syncthing.nix
    ./hardware-configuration.nix
    ./sleep.nix
  ];
  boot.loader.grub = {
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";

    memtest86.enable = true;

    # Define on which hard drive you want to install Grub.
    device = "/dev/nvme0n1"; # or "nodev" for efi only

    # Set resolution correctly
    gfxmodeBios = "2560x1440x32,1920x1080x32,auto";
    gfxmodeEfi = "2560x1440x32,1920x1080x32,auto";
  };

  networking.hostName = "nixos-desktop"; # Define your hostname.

  # Unique ID for zfs
  networking.hostId = "b590f6d7";
  # Enable trim for SSD
  # services.zfs.trim.enable = true;

  # Virtualbox
  users.extraGroups.vboxusers.members = [ "rolfst" ];
  virtualisation.virtualbox.host.enable = true;

  # Get Xserver working
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  # Use last driver supporting GT 710
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
        # minecraft
        prismlauncher

        # Needs overrides for macbook
        tor-browser-bundle-bin

        # See CPU sensor information
        zenmonitor
  ];

  # Block distracting websites
  blacklist_ip.distractions.blockedSites = [
    # "reddit.com"
    # "youtube.com"
    "nos.nl"
    "bbc.com"
    "arstechnica.com"
  ];

  # Watch yt on a bigger screen
  home-manager.users.rolfst.programs.mpv.config = {
    ytdl-format = "bestvideo[height<=1440]+bestaudio";
    sub-font-size = 40;
    vo = lib.mkForce "vdpau"; # Workaround for `gpu` variant crashing
  };
}
