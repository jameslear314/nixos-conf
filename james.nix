{ config, pkgs, lib, ... }:

{
  # Steam?
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  }; 

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.james = {
    isNormalUser = true;
    description = "James Lear";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      # Development #
      ## rust
      cargo
      cargo-ui
      cargo-rr
      cargo-apk
      cargo-ndk
      corepack_latest
      ## docker
      docker
      docker-compose
      docker-ls
      docker-slim
      git
      nodejs
      python313
      vim
      virtualenv
      vscode-with-extensions

      # Quality of life *
      obsidian
      tlrc
      nvidia-docker
      nvtopPackages.full

      # Browsers #
      brave
      chromium
      opera

      # AI #
      lmstudio
      jan
    ];
  };
}