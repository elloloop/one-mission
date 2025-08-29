# One Mission

A modern Next.js application built with TypeScript, featuring comprehensive testing, CI/CD pipelines, and best practices.

## 🚀 Features

- **Next.js 15** with App Router
- **TypeScript** for type safety
- **Tailwind CSS** for styling
- **Jest & React Testing Library** for unit testing
- **Playwright** for E2E testing
- **ESLint & Prettier** for code quality
- **Husky** for git hooks
- **Commitlint** for conventional commits
- **GitHub Actions** for CI/CD
- **Firebase & Vercel** deployment options

## 📋 Prerequisites

- Node.js 22.5.0 or later
- npm or yarn package manager

## 🛠️ Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd one-mission
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Set up environment variables**

   ```bash
   cp .env.example .env.local
   # Edit .env.local with your configuration
   ```

4. **Start the development server**

   ```bash
   npm run dev
   ```

   Open [http://localhost:3000](http://localhost:3000) to view the application.

## 📁 Project Structure

```
one-mission/
├── .github/workflows/     # GitHub Actions CI/CD
├── .husky/               # Git hooks
├── e2e/                  # End-to-end tests
├── scripts/              # Build and deployment scripts
├── src/
│   ├── app/              # Next.js App Router pages
│   ├── features/         # Feature-based components
│   └── shared/           # Shared components and utilities
├── tests/                # Unit and integration tests
├── .eslintrc.json        # ESLint configuration
├── .prettierrc           # Prettier configuration
├── jest.config.js        # Jest configuration
├── next.config.ts        # Next.js configuration
├── package.json          # Dependencies and scripts
├── playwright.config.ts  # Playwright configuration
├── tailwind.config.ts    # Tailwind CSS configuration
└── tsconfig.json         # TypeScript configuration
```

## 🧪 Testing

### Unit Tests

```bash
# Run all unit tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:ci
```

### E2E Tests

```bash
# Run all E2E tests
npm run test:e2e

# Run E2E tests with UI
npm run test:e2e:ui

# Run E2E tests in debug mode
npm run test:e2e:debug
```

### All Tests

```bash
# Run linting, type checking, unit tests, and E2E tests
npm run test:all
```

## 🔧 Development

### Initial Setup

```bash
# Setup local development environment
npm run setup:local

# Or manually:
# 1. Ensure you're using Node.js 18.18.0
nvm use 18.18.0

# 2. Install dependencies
npm install

# 3. Copy environment template
cp env.template .env.local
# Edit .env.local with your Firebase configuration
```

### Development Workflow

**Important**: Always create new features in separate branches and use Pull Requests!

```bash
# Create a new feature branch
git checkout -b feature/your-feature-name

# Make your changes...

# Run tests to ensure everything works
npm test
npm run test:e2e

# Commit your changes
git add .
git commit -m "feat: add your feature description"

# Push and create a Pull Request
git push origin feature/your-feature-name
# Then create PR on GitHub
```

### Code Quality

```bash
# Lint code
npm run lint

# Type check
npm run typecheck

# Format code
npm run format
```

### Build

```bash
# Build for production
npm run build:prod

# Build with bundle analysis
npm run build:analyze
```

## 🚀 Deployment

### Firebase

```bash
# Deploy to Firebase
npm run deploy:firebase

# Build and deploy
npm run deploy:firebase:full
```

### Vercel

```bash
# Deploy to Vercel
npm run deploy:vercel
```

### AWS S3

```bash
# Deploy to S3
npm run deploy:s3

# Build and deploy
npm run deploy:s3:full
```

## 🔄 CI/CD

The project includes comprehensive GitHub Actions workflows:

- **Pipeline**: Runs on every push and PR to main branch
  - Linting
  - Type checking
  - Unit tests
  - E2E tests (can be skipped with `[skip e2e]` in commit message)
  - Coverage reporting

- **Deployments**: Automatic deployment to various platforms
  - Firebase Hosting
  - Vercel
  - AWS S3

## 📝 Git Workflow

### Conventional Commits

This project uses conventional commits. Commit messages should follow this format:

```
type(scope): description

[optional body]

[optional footer]
```

Types:

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Test changes
- `build`: Build system changes
- `ci`: CI/CD changes
- `chore`: Maintenance tasks
- `revert`: Revert previous commit

### Pre-commit Hooks

The following checks run automatically on commit:

- ESLint fixes
- Prettier formatting
- TypeScript type checking

## 🛡️ Security

- All dependencies are regularly updated
- Security vulnerabilities are monitored
- Environment variables are properly managed
- No sensitive data is committed to the repository

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests (`npm run test:all`)
5. Commit your changes (`git commit -m 'feat: add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues or have questions:

1. Check the [Issues](../../issues) page
2. Create a new issue with detailed information
3. Include steps to reproduce the problem

## 🔗 Links

- [Next.js Documentation](https://nextjs.org/docs)
- [TypeScript Documentation](https://www.typescriptlang.org/docs)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Jest Documentation](https://jestjs.io/docs/getting-started)
- [Playwright Documentation](https://playwright.dev/docs/intro)
