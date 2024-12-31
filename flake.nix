{
  description = "Void's flake setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    rio.url = "github:raphamorim/rio";

    # gBar.url = "github:i01011001/gBar";
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      hostname = "nixos";
      username = "void";
    in
    # system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos
          ./overlays
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              extraSpecialArgs = { inherit inputs; };
              users.${username} = {
                imports = [
                  ./home-manager
                  # ./modules/home-manager/hypr
                  # inputs.gBar.homeManagerModules.x86_64-linux.default

                ];
              };
            };
          }
        ];
      };
    };
}
