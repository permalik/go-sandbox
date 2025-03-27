{
  description = "permalik go_curricula";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-darwin"];
    forAllSystems = f:
      builtins.listToAttrs (map (system: {
          name = system;
          value = f system;
        })
        systems);
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = false;
      };

      shell = pkgs.mkShell {
        buildInputs = [
          pkgs.alejandra
          pkgs.go_1_23
          pkgs.golangci-lint
        ];

        shellHook = ''
          # Custom Prompt
          export PS1="\[\e[1;32m\][devshell] \w \$\[\e[0m\]\n❯ "
        '';
      };
    in {
      default = shell;
    });
  };
}
