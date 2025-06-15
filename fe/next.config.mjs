/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  images: {
    remotePatterns: [
      {
        hostname: "res.cloudinary.com",
      },
    ],
  },
  eslint: {
      ignoreDuringBuilds: true,
  }
};

export default nextConfig;
