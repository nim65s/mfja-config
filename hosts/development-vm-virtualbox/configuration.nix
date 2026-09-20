{
  flake,
  modulesPath,
  ...
}:
{
  imports = [
    "${flake}/modules/nixos/mfja-common.nix"
    "${modulesPath}/virtualisation/virtualbox-image.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  virtualbox = {
    baseImageFreeSpace = 10 * 1024;
    memorySize = 4096;
  };
  virtualisation.diskSize = "auto";
}
