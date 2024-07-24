{
  description = "landing";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs{ inherit system; };
      in
      {
        defaultPackage = pkgs.hello;

        devShell =
          pkgs.mkShell {
            buildInputs = [
              # pkgs.psa
              pkgs.nodejs
              # pkgs.yarn
            ];
          };
      });
}
