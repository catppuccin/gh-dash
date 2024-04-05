{
  description = "Development shell flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    catppuccin-toolbox.url = "github:catppuccin/toolbox";
  };

  outputs = {
    nixpkgs,
    catppuccin-toolbox,
    ...
  }: let
    forAllSystems = nixpkgs.lib.genAttrs ["x86_64-linux" "x86_64-darwin" "i686-linux" "aarch64-linux" "aarch64-darwin"];

    pkgsForEach = nixpkgs.legacyPackages;
  in {
    devShells = forAllSystems (system: {
      default = pkgsForEach.${system}.mkShell {
        nativeBuildInputs = with pkgsForEach.${system}; [
          just
          catppuccin-toolbox.packages.${system}.whiskers
          catppuccin-toolbox.packages.${system}.catwalk
        ];
      };
    });
  };
}
