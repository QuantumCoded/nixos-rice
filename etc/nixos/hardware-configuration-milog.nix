# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  networking.hostName = "milog";

  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;

  boot.loader.grub.device = "/dev/disk/by-id/ata-Hitachi_HTS542520K9SA00_080531BB6D00WHC4DMRF";

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ata_piix" "ahci" "firewire_ohci" "usb_storage" "sd_mod" "sr_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s29f7u4.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # {{{ Filesystems
  boot.initrd.luks.devices."milog-crypt".device = "/dev/disk/by-partlabel/milog-crypt";

  fileSystems =
  {
    "/" =
    {
      device  = "/dev/disk/by-label/milog";
      fsType  = "btrfs";
      options = [ "subvol=/root" ];
    };

    "/boot" =
    {
      device  = "/dev/disk/by-label/ESP";
      fsType  = "vfat";
      depends = [ "/" ];
    };

    "/.btrfs-root" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/" ];
    };

    "/nix" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/nix" ];
    };

    "/home" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/home" ];
    };

    "/.swap" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/swap" ];
    };

    "/.snapshots" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/snapshots" ];
    };

    "/.snapshots.externalhdd" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/snapshots.externalhdd" ];
    };

    "/var/cache" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/var-cache" ];
    };

    "/var/log" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/var-log" ];
    };

    "/var/tmp" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/var-tmp" ];
    };

    "/var/lib/libvirt/images" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" ];
      options = [ "subvol=/vms" ];
    };

    "/home/andy3153/games" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" "/home" ];
      options = [ "subvol=/games" ];
    };

    "/home/andy3153/torrents" =
    {
      device = "/dev/disk/by-label/milog";
      fsType = "btrfs";
      depends = [ "/" "/home" ];
      options = [ "subvol=/torrents" ];
    };
  };

  swapDevices = [ { device = "/.swap/swapfile"; } ];
  # }}}
}
