{pkgs, ...}:

{

home.packages = [
# Command Line
    pkgs.curl
    pkgs.unzip
    pkgs.gzip
    pkgs.tree
    pkgs.libqalculate

# Dev
    pkgs.nodejs_24
    pkgs.pnpm_9
    pkgs.python314
    pkgs.poetry
    pkgs.gcc
    pkgs.vscode
    pkgs.docker

# LSP neovim
    pkgs.pyright   # LSP para Python
    pkgs.nodePackages."@astrojs/language-server"  # LSP para Astro
    pkgs.nodePackages.typescript    # TypeScript
    pkgs.nodePackages.typescript-language-server
    pkgs.lua-language-server

# NeoVim
    pkgs.fd              # Búsqueda rápida de archivos
    pkgs.ripgrep
    pkgs.inotify-tools  # Para recargar la configuración de Neovim automáticamente 
    pkgs.tree-sitter

# Apps
    pkgs.vlc
    pkgs.obsidian
    pkgs.spotify
    pkgs.obs-studio
    pkgs.dbeaver-bin

# Dependens
  pkgs.kdePackages.dolphin
  pkgs.ffmpeg-headless           # video decoding
  pkgs.ffmpegthumbnailer         # thumbnail generator
  pkgs.v4l-utils
  pkgs.guvcview

# App cli 
    pkgs.redshift
    pkgs.nnn
    pkgs.pavucontrol
    pkgs.playerctl
    pkgs.ttyper
    pkgs.typer
    pkgs.peaclock

];


}
