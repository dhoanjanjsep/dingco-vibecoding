import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Cursor Talk to Figma MCP - AI 디자인 자동화 도구',
  description: 'Cursor AI와 Figma를 연결하는 Model Context Protocol 통합 도구',
  keywords: 'Cursor, Figma, MCP, AI, Design Automation, 디자인 자동화',
  authors: [{ name: 'dhoanjanjsep' }],
  creator: 'dhoanjanjsep',
  publisher: 'dhoanjanjsep',
  robots: 'index, follow',
  openGraph: {
    title: 'Cursor Talk to Figma MCP',
    description: 'AI와 Figma를 연결하는 Model Context Protocol 통합 도구',
    type: 'website',
    url: 'https://dhoanjanjsep.github.io/dingco-vibecoding/',
    siteName: 'Cursor Talk to Figma MCP',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Cursor Talk to Figma MCP',
    description: 'AI와 Figma를 연결하는 Model Context Protocol 통합 도구',
  },
  verification: {
    google: 'E6tWG2zykDGvDMs5W_VpCZbbvPcPsGVgxqA4l7cU3L8',
  },
  alternates: {
    canonical: 'https://dhoanjanjsep.github.io/dingco-vibecoding/',
  },
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="ko">
      <head>
        <link rel="sitemap" type="application/xml" href="/sitemap.xml" />
        <link rel="alternate" type="application/rss+xml" title="Cursor Talk to Figma MCP RSS Feed" href="/rss.xml" />
      </head>
      <body className={inter.className}>{children}</body>
    </html>
  )
}
