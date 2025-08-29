#!/bin/bash

# Firebase Secrets Setup Script
# This script helps you set up Firebase secrets for GitHub Actions

echo "🔥 Firebase Secrets Setup for One Mission"
echo "=========================================="

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed. Please install it first:"
    echo "   brew install gh"
    exit 1
fi

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub. Please run:"
    echo "   gh auth login"
    exit 1
fi

echo "✅ GitHub CLI is ready"

# Function to prompt for secret
prompt_secret() {
    local secret_name=$1
    local description=$2
    local is_required=${3:-true}
    
    echo ""
    echo "📝 $description"
    if [ "$is_required" = "true" ]; then
        echo "   (Required)"
    else
        echo "   (Optional)"
    fi
    
    read -p "Enter value for $secret_name: " secret_value
    
    if [ -n "$secret_value" ]; then
        echo "🔐 Setting secret: $secret_name"
        echo "$secret_value" | gh secret set "$secret_name" --body-file -
        if [ $? -eq 0 ]; then
            echo "✅ Secret '$secret_name' set successfully"
        else
            echo "❌ Failed to set secret '$secret_name'"
        fi
    elif [ "$is_required" = "true" ]; then
        echo "❌ $secret_name is required. Please provide a value."
        return 1
    else
        echo "⏭️  Skipping optional secret: $secret_name"
    fi
}

echo ""
echo "🚀 Let's set up your Firebase secrets!"
echo ""
echo "You'll need to get these values from your Firebase Console:"
echo "1. Go to https://console.firebase.google.com/"
echo "2. Select your project (or create one named 'one-mission')"
echo "3. Go to Project Settings > General"
echo "4. Scroll down to 'Your apps' and add a web app"
echo "5. Copy the configuration values"
echo ""

# Required Firebase secrets
prompt_secret "NEXT_PUBLIC_FIREBASE_API_KEY" "Firebase API Key" "true"
prompt_secret "NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN" "Firebase Auth Domain (e.g., one-mission.firebaseapp.com)" "true"
prompt_secret "NEXT_PUBLIC_FIREBASE_PROJECT_ID" "Firebase Project ID (e.g., one-mission)" "true"
prompt_secret "NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET" "Firebase Storage Bucket (e.g., one-mission.appspot.com)" "true"
prompt_secret "NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID" "Firebase Messaging Sender ID" "true"
prompt_secret "NEXT_PUBLIC_FIREBASE_APP_ID" "Firebase App ID" "true"

echo ""
echo "🔐 Now let's set up the Firebase Service Account:"
echo ""
echo "1. Go to Firebase Console > Project Settings > Service Accounts"
echo "2. Click 'Generate new private key'"
echo "3. Download the JSON file"
echo "4. Copy the entire JSON content"
echo ""

read -p "Paste the Firebase service account JSON content: " service_account_json

if [ -n "$service_account_json" ]; then
    echo "🔐 Setting Firebase service account secret..."
    echo "$service_account_json" | gh secret set "FIREBASE_SERVICE_ACCOUNT_ONE_MISSION" --body-file -
    if [ $? -eq 0 ]; then
        echo "✅ Firebase service account secret set successfully"
    else
        echo "❌ Failed to set Firebase service account secret"
    fi
else
    echo "❌ Firebase service account JSON is required for deployment"
fi

echo ""
echo "🎉 Firebase secrets setup complete!"
echo ""
echo "Next steps:"
echo "1. Create a .env.local file for local development"
echo "2. Test your Firebase configuration locally"
echo "3. Push your changes to trigger the deployment"
echo ""
echo "For local development, create .env.local with:"
echo "NEXT_PUBLIC_FIREBASE_API_KEY=your_api_key"
echo "NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_auth_domain"
echo "NEXT_PUBLIC_FIREBASE_PROJECT_ID=your_project_id"
echo "NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_storage_bucket"
echo "NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id"
echo "NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id"
