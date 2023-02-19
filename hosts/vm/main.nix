{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";

  };

  networking.hostName = "nixos-vm"; # Define your hostname.

  # Unique ID for zfs
  networking.hostId = "b590f6d7";
  # Enable trim for SSD
  # services.zfs.trim.enable = true;

  # Virtualbox

  # Get Xserver working
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  # Use last driver supporting GT 710
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
        # minecraft

        # Needs overrides for macbook

        # See CPU sensor information
        zenmonitor
  ];
}
