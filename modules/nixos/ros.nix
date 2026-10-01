{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.python3Packages.argcomplete
    pkgs.vcs2l
  ];
  programs.bash.interactiveShellInit = ''
    eval "$(register-python-argcomplete colcon ros2)"
  '';
}
