#!/bin/bash

#
# Destroy Non-Vitals
#

# Remove Go Source
rm main.go
rm go.mod
rm -rf fundamentals

#
# Initialize Boilerplate
#

# Init main.go
cat << EOF > main.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
EOF

# Init Go Module
go mod init go_sandbox
