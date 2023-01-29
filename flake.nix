{
  # basic nix syntac
  # inputs = { nixpkg.url = ""; home-manager.url = ""}
  # is equivalent to
  # inputs.nixkpg.url = "";
  # inputs.home-manager.url = "";
  
  description = "A flake sample for setup with overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };
  
  outputs = { self, nixpkgs, home-manager, darwin, emacs-overlay }: 
    let
      overlays = [
        emacs-overlay.overlay
      ];
    in {
      # darwinConfiguration."your-hostname" is mantertory
      # you can check your hostname by running `hostname` in terminal
      # abc for abc.local for example.
      darwinConfiguration."abc" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          home-manager.darwinModules.home-manager
          {
            nixpkgs.overlays = overlays;
          }
          # file name and location can be changed.
          ./my-setup.nix
        ];
      };
    };
}
