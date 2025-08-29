#!/bin/bash

# Run unit tests with coverage
echo "🧪 Running unit tests..."

# Check if we're in CI environment
if [ "$CI" = "true" ]; then
    echo "Running in CI mode..."
    npm test -- --coverage --watchAll=false --passWithNoTests
else
    echo "Running in local mode..."
    npm test -- --coverage --watchAll=false --passWithNoTests
fi

# Check if tests passed
if [ $? -eq 0 ]; then
    echo "✅ Unit tests passed"
    exit 0
else
    echo "❌ Unit tests failed"
    exit 1
fi
