{
  description = "csharp_sandbox";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = false;
      };

      dotnetApp = pkgs.buildDotnetModule {
        pname = "csharp_sandbox";
        version = "0.0.1";
        src = ./.;

        buildType = "release";
        projectFile = "./csharp_sandbox.csproj";
        executables = ["csharp_sandbox"];
        dotnet-sdk = pkgs.dotnetCorePackages.sdk_9_0;
        dotnet-runtime = pkgs.dotnetCorePackages.runtime_9_0;
        nugetDeps = ./deps.json;
      };
    in {
      packages.default = dotnetApp;

      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          alejandra
          pre-commit
          dotnetCorePackages.sdk_9_0
          omnisharp-roslyn
          nuget-to-json
        ];

        DOTNET_BIN = "${pkgs.dotnetCorePackages.sdk_9_0}/bin/dotnet";
        shellHook = ''
          cd csharp-sandbox
          . .bashrc
        '';
      };
    });
}
