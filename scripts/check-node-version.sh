#!/bin/bash

# Check if the required Node.js version is installed
REQUIRED_VERSION=$(cat .nvmrc 2>/dev/null || echo "22.5.0")
CURRENT_VERSION=$(node --version 2>/dev/null | sed 's/v//')

if [ -z "$CURRENT_VERSION" ]; then
    echo "❌ Node.js is not installed"
    echo "Please install Node.js version $REQUIRED_VERSION or later"
    exit 1
fi

# Compare versions
if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$CURRENT_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "❌ Node.js version $CURRENT_VERSION is older than required version $REQUIRED_VERSION"
    echo "Please upgrade Node.js to version $REQUIRED_VERSION or later"
    exit 1
fi

echo "✅ Node.js version $CURRENT_VERSION is compatible"
