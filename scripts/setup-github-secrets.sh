#!/bin/bash

# Setup GitHub Secrets for Firebase Deployment
echo "🔐 Setting up GitHub Secrets for Firebase Deployment"
echo "=================================================="

# Check if gh CLI is installed and authenticated
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed. Please install it first:"
    echo "   brew install gh"
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub. Please run:"
    echo "   gh auth login"
    exit 1
fi

echo "✅ GitHub CLI is ready"

# Firebase configuration values
FIREBASE_API_KEY="AIzaSyC9fkhe_unKzYyqZn93enpUuUtibkMhw6E"
FIREBASE_AUTH_DOMAIN="one-mission-app.firebaseapp.com"
FIREBASE_PROJECT_ID="one-mission-app"
FIREBASE_STORAGE_BUCKET="one-mission-app.firebasestorage.app"
FIREBASE_MESSAGING_SENDER_ID="322489333368"
FIREBASE_APP_ID="1:322489333368:web:6c1f31987f33c86192df8d"

echo ""
echo "🔐 Setting up Firebase environment variables as GitHub secrets..."

# Set Firebase environment variables as secrets
echo "Setting NEXT_PUBLIC_FIREBASE_API_KEY..."
echo "$FIREBASE_API_KEY" | gh secret set NEXT_PUBLIC_FIREBASE_API_KEY

echo "Setting NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN..."
echo "$FIREBASE_AUTH_DOMAIN" | gh secret set NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN

echo "Setting NEXT_PUBLIC_FIREBASE_PROJECT_ID..."
echo "$FIREBASE_PROJECT_ID" | gh secret set NEXT_PUBLIC_FIREBASE_PROJECT_ID

echo "Setting NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET..."
echo "$FIREBASE_STORAGE_BUCKET" | gh secret set NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET

echo "Setting NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID..."
echo "$FIREBASE_MESSAGING_SENDER_ID" | gh secret set NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID

echo "Setting NEXT_PUBLIC_FIREBASE_APP_ID..."
echo "$FIREBASE_APP_ID" | gh secret set NEXT_PUBLIC_FIREBASE_APP_ID

echo ""
echo "✅ All Firebase environment variables have been set as GitHub secrets!"
echo ""
echo "📋 Summary of secrets set:"
echo "   - NEXT_PUBLIC_FIREBASE_API_KEY"
echo "   - NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN"
echo "   - NEXT_PUBLIC_FIREBASE_PROJECT_ID"
echo "   - NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET"
echo "   - NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID"
echo "   - NEXT_PUBLIC_FIREBASE_APP_ID"
echo "   - FIREBASE_SERVICE_ACCOUNT_ONE_MISSION_APP (already set by Firebase CLI)"
echo ""
echo "🚀 Your CI/CD pipeline is now ready!"
echo "   - Push to main branch → Automatic deployment to Firebase"
echo "   - Create PR → Preview deployment"
echo "   - Manual deployment via GitHub Actions UI"
