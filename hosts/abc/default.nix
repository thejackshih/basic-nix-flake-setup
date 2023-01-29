{ pkgs, ...}:
{ 
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
experimental-features = nix-command flakes
'';
  };

  programs.zsh.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  # change abc to your username
  # check username by running `whoami` command in terminal.
  home-manager.users.abc = { pkgs, ... }: {
    home.stateVersion = "22.11";
    home.packages = [
      # pkgs.emacsPgtk
    ];
  };

  fonts = {
    fontDir.enable = true;
    fonts = [];
  };

  ## macOS Setting.
  # system = {
  #   defaults = {
  #     NSGlobalDomain = {
  #       _HIHideMenuBar = false;
  #     };
  #     dock = {
  #       autohide = true;
  #     };
  #   };
  #   keyboard = {
  #     enableKeyMapping = true;
  #     remapCapsLockToControl = true;
  #   };
  # };
  
  
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    ## uncomment the line below if you want to auto remove any formula not listed below.
    # onActivation.cleanup = "uninstall";

    brews = [
      # "tree-sitter"
      # {
      #   name = "emacs-plus@30";
      #   args = ["with-widgets"];
      #   link = true;
      # }
    ];
    casks = [
      # "1password"
      # "alfred"
      # "rectangle"
      # "font-fira-code"
    ];
    taps = [
      # "d12frosted/emacs-plus"
      # "homebrew/bundle"
      # "homebrew/cask"
      # "homebrew/cask-drivers"
      # "homebrew/cask-fonts"
      # "homebrew/core"
      # "homebrew/services"
    ];
  };
}
 
