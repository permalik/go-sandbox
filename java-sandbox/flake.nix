{
  description = "java_sandbox";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
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
            pkgs.temurin-bin
            pkgs.scala_2_13
            pkgs.scala
            pkgs.sbt
            pkgs.pkgs.clojure
          ];

          shellHook = ''
            cd java-sandbox
            export JAVA_HOME=${pkgs.temurin-bin}/lib/openjdk
            export PATH=$JAVA_HOME/bin:$PATH
            alias run-java="sbt run"
            alias run-scala="sbt run"
            alias run-clj="clj -M -m hello-clojure"
            . .bashrc
          '';
        };
      }
    );
}
