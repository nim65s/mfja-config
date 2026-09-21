{
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
        builtins.readFile ../keys/diane + builtins.readFile ../keys/guilhem
      );
    };
    user = {
      isNormalUser = true;
      initialPassword = "user";
    };
  };
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = [
    pkgs.gcc
    pkgs.git
    pkgs.cmake
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

  system.autoUpgrade = {
    enable = true;
    flake = "github:nim65s/mfja-config";
  };

  system.stateVersion = "26.05";
}
