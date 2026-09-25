{
  flake,
  ...
}:
{
  imports = [
    flake.modules.nixos.mfja-laptop
  ];

  networking.hostName = "development";
  nixpkgs.hostPlatform = "x86_64-linux";
}
