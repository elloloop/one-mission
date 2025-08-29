#!/bin/bash

# Setup Environment Variables Script
echo "🔥 Setting up Firebase environment variables for One Mission"
echo "=========================================================="

# Create .env.local file with Firebase configuration
cat > .env.local << 'EOF'
# Firebase Configuration
NEXT_PUBLIC_FIREBASE_API_KEY=AIzaSyC9fkhe_unKzYyqZn93enpUuUtibkMhw6E
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=one-mission-app.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=one-mission-app
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=one-mission-app.firebasestorage.app
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=322489333368
NEXT_PUBLIC_FIREBASE_APP_ID=1:322489333368:web:6c1f31987f33c86192df8d

# App Configuration
NEXT_PUBLIC_APP_ENV=development
NEXT_PUBLIC_APP_URL=http://localhost:3000
EOF

echo "✅ Created .env.local file with Firebase configuration"
echo ""
echo "📋 Firebase Configuration Summary:"
echo "   Project ID: one-mission-app"
echo "   Auth Domain: one-mission-app.firebaseapp.com"
echo "   Storage Bucket: one-mission-app.firebasestorage.app"
echo "   App ID: 1:322489333368:web:6c1f31987f33c86192df8d"
echo ""
echo "🚀 Next steps:"
echo "   1. Test the configuration: npm run dev"
echo "   2. Build the project: npm run build"
echo "   3. Deploy to Firebase: firebase deploy"
echo ""
echo "🔐 GitHub Secrets:"
echo "   The Firebase service account has been automatically added to your GitHub repository"
echo "   as FIREBASE_SERVICE_ACCOUNT_ONE_MISSION_APP"
