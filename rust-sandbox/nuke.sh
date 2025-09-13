#!/bin/bash

# Remove Rust Source
rm -rf src
rm Cargo.lock

# Init Rust
mkdir src
echo 'fn main() {
    println!("started..");
}' > src/main.rs
