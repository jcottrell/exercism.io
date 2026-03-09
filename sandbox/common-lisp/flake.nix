{
  description = "Common Lisp dev shell (SBCL + Dexador + OpenSSL)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        sbcl
        openssl.out
      ];

      shellHook = ''
      export LD_LIBRARY_PATH=${pkgs.openssl.out}/lib''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
      echo "Ready to start sbcl (or emacs?)."
      '';
    };
  };
}
