#!/bin/bash

pre-commit install

pre-commit clean

{
cat << 'EOF'
#!/bin/bash

# Format and lint
echo "Go format and lint.."

# # Find all Go files in the repository (staged or unmodified)
# ALL_GO_FILES=$(git ls-files -- '*.go')
#
# if [ -z "$ALL_GO_FILES" ]; then
#     echo "No Go files to format or lint."
#     exit 0
# fi

echo "Execute: goimports"
goimports -l -w .

# # Add formatted files back to the staging area
# git add $ALL_GO_FILES

# Run golangci-lint on all Go files
echo "Execute: golangci-lint"
golangci-lint run --fix --timeout=5m

# Fail commit on linting errors
if [ $? -ne 0 ]; then
    echo "Error: golangci-lint failed."
    exit 1
fi

echo "Complete: Go format and lint"
EOF

    cat .git/hooks/pre-commit
} > .git/hooks/pre-commit.tmp

mv .git/hooks/pre-commit.tmp .git/hooks/pre-commit

sudo chmod +x .git/hooks/pre-commit

echo "Appended Go formatting and linting"
