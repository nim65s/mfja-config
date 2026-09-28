{
  pkgs,
}:
pkgs.vscode-with-extensions.override {
  vscode = pkgs.vscodium;
  vscodeExtensions =
    with pkgs.vscode-extensions;
    [
      charliermarsh.ruff
      ms-python.python
      ms-vscode.cpptools
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "rde-ros-2";
        publisher = "Ranch-Hand-Robotics";
        version = "1.2.1";
        hash = "sha256-KpdmgrRymQXZhpfmqZPBcVOtCFdoQeyWXSe/07caYVM=";
      }
    ];
}
