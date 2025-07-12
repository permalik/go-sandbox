# go-sandbox
sandbox:Go Programming and Turnkey Ecosystem

### Development
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
