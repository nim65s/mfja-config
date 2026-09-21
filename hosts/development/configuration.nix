{
  flake,
  ...
}:
{
  imports = [
    "${flake}/modules/mfja-common.nix"
  ];

  networking.hostName = "development";
  nixpkgs.hostPlatform = "x86_64-linux";
}
