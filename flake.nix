{
  description = "configurations for VMs, containers and systems used at MFJA";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    systems.url = "github:nix-systems/default/refs/pull/3/merge";

    blueprint = {
      url = "github:numtide/blueprint/refs/pull/161/merge";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.blueprint {
      inherit inputs;
    };
}
