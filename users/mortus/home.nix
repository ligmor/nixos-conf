# ~/nixos-flake/users/mortus/home.nix
{ pkgs, ... }:

{
  home.username = "mortus";
  home.homeDirectory = "/home/mortus";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.hack
    ];


  imports = [
    ./programs/git.nix
    ./packages.nix
    ./programs/zsh.nix
  ];

}
