{
  lib,
  ...
}:
{
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";

  console.useXkbConfig = true;
  services.xserver.xkb.layout = "fr";

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

  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "user";
    };
    openssh.enable = true;
    xserver.desktopManager.xfce.enable = true;
  };

  system.stateVersion = "26.05";

  system.autoUpgrade = {
    enable = true;
    flake = "github:nim65s/mfja-config";
  };
}
