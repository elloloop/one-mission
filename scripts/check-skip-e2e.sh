#!/bin/bash

# Check if E2E tests should be skipped based on commit message
# This script checks for the presence of [skip e2e] in the commit message

# Get the commit message
if [ -n "$TEST_COMMIT_MSG" ]; then
    COMMIT_MSG="$TEST_COMMIT_MSG"
else
    # Try to get commit message from git
    if command -v git >/dev/null 2>&1; then
        COMMIT_MSG=$(git log -1 --pretty=%B 2>/dev/null || echo "")
    else
        COMMIT_MSG=""
    fi
fi

# Check if [skip e2e] is in the commit message
if echo "$COMMIT_MSG" | grep -q "\[skip e2e\]"; then
    echo "skip_e2e=true" >> $GITHUB_OUTPUT
    echo "🔄 Skipping E2E tests due to [skip e2e] in commit message"
    exit 0
fi

echo "skip_e2e=false" >> $GITHUB_OUTPUT
echo "✅ Running E2E tests"
