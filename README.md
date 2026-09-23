# MFJA Config

This repo contain a set of configurations for VMs, containers and systems used at MFJA

## development-vm-virtualbox

```
nix build .#nixosConfigurations.development-vm-virtualbox.config.system.build.image
VirtualBox ./result/*.ova
```

## development

- boot on nixos iso
- connect to internet

```
sudo nix \
  --extra-experimental-features nix-command \
  --extra-experimental-features flakes \
  run github:nix-community/disko#disko-install \
   -- \
   -- --write-efi-boot-entries \
   --flake github:nim65s/mfja-config#development \
   --disk main /dev/nvme0n1
```
