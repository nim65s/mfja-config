# MFJA Config

This repo contain a set of configurations for VMs, containers and systems used at MFJA

## development-vm-virtualbox

```
nix build .#nixosConfigurations.development-vm-virtualbox.config.system.build.image
VirtualBox ./result/*.ova
```
