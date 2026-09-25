{
  flake,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.disko
    flake.modules.nixos.disko-single-ext4
    flake.modules.nixos.mfja-common
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  environment.systemPackages = [
    pkgs.networkmanagerapplet
    pkgs.xfce4-appfinder
  ];

  networking.networkmanager.enable = true;

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
