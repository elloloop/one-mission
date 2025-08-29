/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export', // For static hosting
  trailingSlash: true, // Required for Firebase hosting
  experimental: {
    typedRoutes: true,
  },
  images: {
    unoptimized: true, // Required for static export
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
      },
    ],
  },
};

module.exports = nextConfig;
