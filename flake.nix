{
  description = "go_curricula";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = false;
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.alejandra
            pkgs.go_1_23
            pkgs.golangci-lint
            pkgs.pre-commit
          ];

          shellHook = ''
            # Custom Prompt
            export PS1="\n\[\e[1;32m\][devshell](go) \w\n❯ \[\e[0m\]"

            go install golang.org/x/tools/cmd/goimports@latest
          '';
        };
      }
    );
}
