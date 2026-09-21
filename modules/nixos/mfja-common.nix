{
  lib,
  pkgs,
  ...
}:
{
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";

  console.useXkbConfig = true;

  users.users = {
    diane = {
      isNormalUser = true;
      initialHashedPassword = "$y$j9T$jFAZl.WqlcNAijcNyuWod1$1G.o/eaiMX8s/2s9veDxQETZUKmBdCfdUUmP9wRUjMD";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../users/diane/keys);
    };
    guilhem = {
      isNormalUser = true;
      initialHashedPassword = "$y$j9T$jFAZl.WqlcNAijcNyuWod1$1G.o/eaiMX8s/2s9veDxQETZUKmBdCfdUUmP9wRUjMD";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = lib.splitString "\n" (builtins.readFile ../../users/guilhem/keys);
    };
    user = {
      isNormalUser = true;
      initialHashedPassword = "user";
    };
  };
  security.sudo.wheelNeedsPassword = false;

  programs = {
    vim.enable = true;
    git.enable = true;
  };

  environment.systemPackages = [
    pkgs.gcc
    pkgs.cmake
    pkgs.prek
    pkgs.uv
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
