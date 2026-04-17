{
  description = "Home-lab tooling";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      let pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.mkShell {
        packages = with pkgs; [
          docker
          kubectl
          k3d
          helm
        ];

        shellHook = ''
          echo "Home-lab tooling environment activated"
        '';
      };
  };
}