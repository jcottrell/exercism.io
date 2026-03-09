{
  description = "Support exercism.io site for learning";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        exercism
      ];

      shellHook = ''
      echo "Finished exercism setup."
      '';
    };
  };
}
