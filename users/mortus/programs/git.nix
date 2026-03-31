{pkgs, ...}:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "morlig";
        email = "morlig@toodeck.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
