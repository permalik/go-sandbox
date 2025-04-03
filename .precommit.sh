#!/bin/bash

pre-commit install

pre-commit clean

cat << 'EOF' >> .git/hooks/pre-commit

# Run gofmt, goimports, and golangci-lint on all staged and unmodified Go files
echo "Running gofmt, goimports, and golangci-lint..."

# Find all Go files in the repository (staged or unmodified)
ALL_GO_FILES=$(git ls-files -- '*.go')

if [ -z "$ALL_GO_FILES" ]; then
    echo "No Go files to format or lint."
    exit 0
fi

# Run gofmt and goimports on all Go files
echo "Running gofmt..."
gofmt -w $ALL_GO_FILES

echo "Running goimports..."
goimports -w $ALL_GO_FILES

# Add formatted files back to the staging area
git add $ALL_GO_FILES

# Run golangci-lint on all Go files
echo "Running golangci-lint..."
golangci-lint run --fix --timeout=5m $ALL_GO_FILES

# If linting fails, do not allow the commit
if [ $? -ne 0 ]; then
    echo "golangci-lint failed. Fix the errors before committing."
    exit 1
fi

echo "All checks passed successfully!"
EOF

echo "Appended Go formatting and linting"
