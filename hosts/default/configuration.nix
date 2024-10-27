{ config, pkgs, inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
      ./hardware-configuration.nix
      ../../modules/configuration.nix
      ../../modules/hardware/nvidia.nix
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ailko" = import ./ailko.nix;
    };
  };

  environment.interactiveShellInit = "
    alias apply='sudo nixos-rebuild switch --flake /etc/nixos#default'
    alias update='sudo nix flake update'
  ";
}