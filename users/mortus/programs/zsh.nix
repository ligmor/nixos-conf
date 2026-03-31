{pkgs, ...}:

{
programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "sudo" "poetry" ];
    };
    initContent = ''
    # El path donde Home Manager instala powerlevel10k
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ${./p10k.zsh}
    
    export XCURSOR_THEME=Adwaita
    export XCURSOR_SIZE=24
    '';
};

}
