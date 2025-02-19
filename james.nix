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
    extraGroups = [ "networkmanager" "wheel" "docker" "jackaudio" ];
    packages = with pkgs; [
      ##### AI #####
      lmstudio
      jan

      ##### Browsers #####
      brave
      chromium
      opera

      ##### Development #####
      #### rust
      cargo
      cargo-ui
      cargo-rr
      cargo-apk
      cargo-ndk

      #### js
      nodejs
      npm-check
      nrr ### npm, yarn, etc

      #### docker
      docker
      docker-compose
      docker-ls
      docker-slim

      #### generic
      git
      vim
      vscode-with-extensions
      pkgs.vscode-extensions.jnoortheen.nix-ide


      #### python
      python313
      virtualenv

      ##### Quality of life #####
      obsidian
      tlrc
      nvidia-docker
      nvtopPackages.full

      ##### Meetings #####
      #/teams ### not on linux
      #/zoom-us ### not on linux
    ];
  };
}