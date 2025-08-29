# Firebase Setup Guide

This guide will help you set up Firebase for the One Mission project and configure the necessary environment variables.

## 🚀 Step 1: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter project name: `one-mission`
4. Choose whether to enable Google Analytics (recommended)
5. Click "Create project"

## 🔧 Step 2: Configure Firebase Hosting

1. In your Firebase project console, go to "Hosting"
2. Click "Get started"
3. Install Firebase CLI globally:
   ```bash
   npm install -g firebase-tools
   ```
4. Login to Firebase:
   ```bash
   firebase login
   ```
5. Initialize Firebase in your project:

   ```bash
   firebase init hosting
   ```

   - Select your project: `one-mission`
   - Public directory: `out` (for Next.js static export)
   - Configure as single-page app: `Yes`
   - Set up automatic builds: `No` (we'll handle this with GitHub Actions)

## 🔑 Step 3: Get Firebase Configuration

1. In Firebase Console, go to Project Settings (gear icon)
2. Scroll down to "Your apps" section
3. Click "Add app" and select "Web"
4. Register app with name: `one-mission-web`
5. Copy the configuration object

## 📝 Step 4: Set Up Environment Variables

### Local Development (.env.local)

Create a `.env.local` file in your project root:

```bash
# Firebase Configuration
NEXT_PUBLIC_FIREBASE_API_KEY=your_api_key_here
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=one-mission.firebaseapp.com
NEXT_PUBLIC_FIREBASE_PROJECT_ID=one-mission
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=one-mission.appspot.com
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id

# App Configuration
NEXT_PUBLIC_APP_ENV=development
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

### GitHub Secrets (for CI/CD)

You need to add these secrets to your GitHub repository:

1. Go to your GitHub repository: `https://github.com/elloloop/one-mission`
2. Click "Settings" tab
3. Click "Secrets and variables" → "Actions"
4. Click "New repository secret"

Add these secrets:

#### Required Secrets:

- `FIREBASE_SERVICE_ACCOUNT_ONE_MISSION`: Firebase service account JSON
- `NEXT_PUBLIC_FIREBASE_API_KEY`: Your Firebase API key
- `NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN`: Your Firebase auth domain
- `NEXT_PUBLIC_FIREBASE_PROJECT_ID`: Your Firebase project ID
- `NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET`: Your Firebase storage bucket
- `NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID`: Your Firebase messaging sender ID
- `NEXT_PUBLIC_FIREBASE_APP_ID`: Your Firebase app ID

## 🔐 Step 5: Create Firebase Service Account

1. In Firebase Console, go to Project Settings
2. Click "Service accounts" tab
3. Click "Generate new private key"
4. Download the JSON file
5. Copy the entire JSON content
6. Add it as a GitHub secret named `FIREBASE_SERVICE_ACCOUNT_ONE_MISSION`

## 🚀 Step 6: Update Next.js Configuration

The project is already configured to export static files for Firebase hosting. The `next.config.js` file includes:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export', // For static hosting
  trailingSlash: true, // Required for Firebase hosting
  images: {
    unoptimized: true, // Required for static export
  },
};

module.exports = nextConfig;
```

## 🧪 Step 7: Test Firebase Configuration

1. Start the development server:

   ```bash
   npm run dev
   ```

2. Check the browser console for any Firebase initialization errors

3. Test the build process:
   ```bash
   npm run build
   ```

## 🔄 Step 8: Deploy to Firebase

### Manual Deployment:

```bash
npm run build
firebase deploy --only hosting
```

### Automatic Deployment (via GitHub Actions):

The project includes GitHub Actions workflows that will automatically deploy to Firebase when you push to the main branch.

## 📋 Environment Variables Reference

| Variable                                   | Description                   | Required        |
| ------------------------------------------ | ----------------------------- | --------------- |
| `NEXT_PUBLIC_FIREBASE_API_KEY`             | Firebase API key              | Yes             |
| `NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN`         | Firebase auth domain          | Yes             |
| `NEXT_PUBLIC_FIREBASE_PROJECT_ID`          | Firebase project ID           | Yes             |
| `NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET`      | Firebase storage bucket       | Yes             |
| `NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID` | Firebase messaging sender ID  | Yes             |
| `NEXT_PUBLIC_FIREBASE_APP_ID`              | Firebase app ID               | Yes             |
| `FIREBASE_SERVICE_ACCOUNT_ONE_MISSION`     | Firebase service account JSON | Yes (for CI/CD) |
| `NEXT_PUBLIC_APP_ENV`                      | Application environment       | No              |
| `NEXT_PUBLIC_APP_URL`                      | Application URL               | No              |

## 🔒 Security Notes

- Never commit `.env.local` to version control
- The `.env.local` file is already in `.gitignore`
- All `NEXT_PUBLIC_` variables are exposed to the client
- Keep service account keys secure and never expose them in client-side code

## 🆘 Troubleshooting

### Common Issues:

1. **"Firebase not initialized" error**
   - Check that all environment variables are set correctly
   - Verify the Firebase configuration in the browser console

2. **"Permission denied" error**
   - Ensure the service account has the necessary permissions
   - Check that the project ID matches your Firebase project

3. **Build fails in CI/CD**
   - Verify all GitHub secrets are set correctly
   - Check the GitHub Actions logs for specific error messages

### Getting Help:

- [Firebase Documentation](https://firebase.google.com/docs)
- [Next.js Documentation](https://nextjs.org/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
