{
  modules,
  ...
}:
{
  imports = [ modules.nixosModules.mfja-common ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
