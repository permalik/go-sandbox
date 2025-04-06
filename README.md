# go_curricula
construct:Go Programming

## Development
### Getting Started
Clone the repo
```sh
git clone git@github.com:permalik/go_curricula.git
```

Enter Nix shell
```sh
nix develop
```

#### Pre-Commit
Run Go formatter, linter, and various Pre-Commit hooks.

Initialize
```sh
# Run the root init script
sudo ./.precommit.sh
```

### Tools
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

## CI

## Production
