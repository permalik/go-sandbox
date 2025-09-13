#!/bin/bash

pre-commit install

pre-commit clean

{
cat << 'EOF'
#!/bin/bash

#
# Go Format and Lint
#

echo "Start: Go Format and Lint"

echo "Execute: goimports"
goimports -l -w .

echo "Execute: golangci-lint"
golangci-lint run --fix --timeout=5m

if [ $? -ne 0 ]; then
    echo "Error: golangci-lint failed."
    exit 1
fi

echo "Complete: Go Format and Lint"

#
# Pre-Commit
#

EOF

cat .git/hooks/pre-commit

} > .git/hooks/pre-commit.tmp

mv .git/hooks/pre-commit.tmp .git/hooks/pre-commit

sudo chmod +x .git/hooks/pre-commit

echo "Success: Appended Go format and lint"
