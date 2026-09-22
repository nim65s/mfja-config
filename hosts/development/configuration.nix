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

  networking.hostName = "development";
  nixpkgs.hostPlatform = "x86_64-linux";
}
