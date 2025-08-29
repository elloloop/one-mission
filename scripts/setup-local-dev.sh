#!/bin/bash

# Setup Local Development Environment Script
echo "🚀 Setting up One Mission local development environment"
echo "======================================================"

# Check Node.js version
echo "📋 Checking Node.js version..."
REQUIRED_VERSION="18.18.0"
CURRENT_VERSION=$(node -v | sed 's/v//')

if [ "$CURRENT_VERSION" != "$REQUIRED_VERSION" ]; then
    echo "⚠️  Node.js version mismatch!"
    echo "   Required: $REQUIRED_VERSION"
    echo "   Current:  $CURRENT_VERSION"
    echo "   Please run: nvm use $REQUIRED_VERSION"
    exit 1
else
    echo "✅ Node.js version is correct: $CURRENT_VERSION"
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if .env.local exists
if [ ! -f ".env.local" ]; then
    echo "📝 Creating .env.local from template..."
    cp env.template .env.local
    echo "✅ .env.local created. Please update with your Firebase configuration."
else
    echo "✅ .env.local already exists"
fi

# Run tests to ensure everything is working
echo "🧪 Running tests..."
npm test

echo ""
echo "🎉 Local development environment setup complete!"
echo "   Run 'npm run dev' to start the development server"
echo "   Run 'npm run build' to build for production"
echo "   Run 'npm run test' to run tests"
echo "   Run 'npm run test:e2e' to run end-to-end tests"
