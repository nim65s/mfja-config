{
  flake,
  lib,
  pkgs,
  ...
}:
{
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";

  users.users = {
    admin = {
      isNormalUser = true;
      initialHashedPassword = "$y$j9T$jFAZl.WqlcNAijcNyuWod1$1G.o/eaiMX8s/2s9veDxQETZUKmBdCfdUUmP9wRUjMD";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = lib.splitString "\n" (
        builtins.readFile "${flake}/keys/diane" + builtins.readFile "${flake}/keys/guilhem"
      );
    };
    cpene = {
      isNormalUser = true;
      initialHashedPassword = "$y$j9T$jFAZl.WqlcNAijcNyuWod1$1G.o/eaiMX8s/2s9veDxQETZUKmBdCfdUUmP9wRUjMD";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile "${flake}/keys/clement");
    };
    user = {
      isNormalUser = true;
      initialPassword = "user";
    };
  };
  security.sudo.wheelNeedsPassword = false;

  programs = {
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
    git.enable = true;
    vim.enable = true;
  };

  environment.systemPackages = [
    pkgs.btop
    pkgs.gcc
    pkgs.git
    pkgs.cmake
    pkgs.firefox
    pkgs.prek
    pkgs.uv
    pkgs.vim
  ];

  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "user";
      };
      defaultSession = "xfce";
    };
    openssh.enable = true;
    xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
      displayManager.lightdm.enable = true;
      xkb.layout = "fr";
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-substituters = [
      "https://gepetto.cachix.org"
      "https://nix-community.cachix.org"
      "https://attic.iid.ciirc.cvut.cz/ros"
    ];
    extra-trusted-public-keys = [
      "gepetto.cachix.org-1:toswMl31VewC0jGkN6+gOelO2Yom0SOHzPwJMY2XiDY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ros:JR95vUYsShSqfA1VTYoFt1Nz6uXasm5QrcOsGry9f6Q="
    ];
  };

  system.autoUpgrade = {
    enable = true;
    flake = "github:nim65s/mfja-config";
  };

  system.stateVersion = "26.05";
}
