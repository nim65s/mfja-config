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

  boot.loader.systemd-boot.enable = true;

  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];

  networking.networkmanager.enable = true;
}
