# go_sandbox
sandbox:Go Programming and Turnkey Ecosystem

[Environment](#environment)
- [Configuration](#configuration)
- [Development](#development)
- [CI](#ci)
- [Production](#production)
- [Nuke](#nuke)

[Curricula](#curricula)
- [Fundamental](#fundamental)
- [Construct](#construct)
- [DataStructure](#datastructure)
- [Algorithm](#algorithm)

## Environment
### Development
#### Getting Started
Clone the repo
```sh
git clone git@github.com:permalik/go_sandbox.git
```

[Install Nix](https://nixos.org/download/)

Enter Nix shell
```sh
nix develop
```

#### Tooling
##### Format and Lint
Nix Format
```sh
alejandra <target>
```

Go Format
```sh
goimports -l -w <target>
```

Go Lint
```sh
golangci-lint run --fix --timeout=5m
```

##### Pre-Commit
Go formatter, linter, and various Pre-Commit hooks.

Initialize
```sh
# Run the root init script
sudo ./.precommit.sh
```
<!--TODO:
##### Secret Management
-->

#### Testing
<!--TODO:-->

### Configuration
#### Shell
The root `.bashrc` will be sourced within the shell.
If changes are needed, update `.bashrc` and restart the shell with `nix develop`

### CI
GitHub Actions on Push and Pull Request using Ubuntu x86_64-Linux Self-Hosted Runner
<!--TODO:
Secret Management
-->
<!--TODO:
Dependabot
-->

### Production
```sh
# Restart Docker
orb restart docker

# Create image
docker build -t go_sandbox:dev .

# Build ephemeral container
docker run --rm go_sandbox:dev

# Destroy image
docker rmi go_sandbox:dev
```

<!--TODO:
Development Build
Production Build
Continuous Delivery
-->

### Nuke
Follow instructions to purge curricula and launch a somewhat opinionated turnkey ecosystem

<!--TODO:-->

## Curricula
### Fundamental
### Construct
### DataStructure
### Algorithm
