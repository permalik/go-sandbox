# go_sandbox
sandbox:Go Curricula and Turnkey Ecosystem

[Environment](#environment)
    - [Development](#development)
    - [CI](#ci)
    - [Production](#production)
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

##### Pre-Commit
Go formatter, linter, and various Pre-Commit hooks.

Initialize
```sh
# Run the root init script
sudo ./.precommit.sh
```

#### Tools
Manual Nix Format
```sh
alejandra <target>
```

Manual Go Format
```sh
goimports -l -w <target>
```

Manual Go Lint
```sh
golangci-lint run --fix --timeout=5m
```

### CI
GitHub Actions on Push and Pull Request using Ubuntu x86_64-Linux Self-Hosted Runner

### Build Environment
#### Development Build
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

-->
