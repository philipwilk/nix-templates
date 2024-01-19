{
  description = "Sample nix c package";

  inputs.nixpkgs.url = "nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarc64-linux" "aarch64-darwin" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    npkg = forAllSystems (system: import nixpkgs {inherit system; overlays = [ self.overlay ]; });
  in
  {
    overlay = final: prev: {
      
    };

    packages = forAllSystems (system: {inherit ( npkg.${system} ) ${pname} });
    defaultPackage = forAllSystems (system: self.packages.${system}.${pname});
    
  };
}
