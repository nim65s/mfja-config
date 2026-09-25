{
  flake,
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.disko
    flake.modules.nixos.disko-single-ext4
    flake.modules.nixos.mfja-common
  ];

  boot.loader.systemd-boot.enable = true;

  networking.wireless.enable = true;
}
