
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users/mortus/programs/steam.nix
      inputs.silentSDDM.nixosModules.default
    ];


  # loading the plymouth theme for the boot screen
  boot.plymouth = {
    enable = true;
    # Instalamos el paquete que contiene la colección de adi1090x
    themePackages = [ pkgs.adi1090x-plymouth-themes ];
    # Seleccionamos el tema específico (se llama 'black_hud' en el paquete)
    theme = "black_hud";
  };

  # Bootloader.
  #  boot.loader.systemd-boot.enable = true;
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false" 
    "u_udev.log_level=3"
    "rd.udev.log_priority=3"
  ];

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mortus = {
    isNormalUser = true;
    description = "mortus";
    extraGroups = [ "networkmanager" "wheel" "docker" "input" "video" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # UI for the system 
  services.xserver.enable = false;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  }
  
  programs.silentSDDM = {
        enable = true;
        theme = "rei";
   };
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
     # Configuración de Hyprland
  };


  services.printing.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
  
  # Apss   
  neovim
  kitty
  firefox
  google-chrome

  # Hyprland dependencies
  ags                 # AGS (Para tus sidebars con JS/API)
  waybar              # Barra
  awww                # Fondos de pantalla
  rofi                # Lanzador
  slurp grim          # Capturas de pantalla
  wl-clipboard        # Copy and paste in Waylan

  # system
  pavucontrol        # Para gestionar PulseAudio (audio moderno)
  brightnessctl    # Para brillo (genérico, funciona casi siempre)
  pamixer          # Para volumen PulseAudio (audio moderno)
  ];
  
  virtualisation.docker.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
    touchpad.tapping = true;
    touchpad.disableWhileTyping = false;
  };

  services.blueman.enable = true; # Interfaz gráfica para Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];

    config.common.default = "*"; # Esto le dice al sistema: "Usa cualquier portal disponible para lo que necesites"

  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # systemPackages
  programs.java.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}
