/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  trailingSlash: true,
  images: {
    unoptimized: true
  },
  basePath: process.env.NODE_ENV === 'production' ? '/dingco-vibecoding' : '',
  assetPrefix: process.env.NODE_ENV === 'production' ? '/dingco-vibecoding/' : '',
  experimental: {
    appDir: true
  }
}

module.exports = nextConfig
