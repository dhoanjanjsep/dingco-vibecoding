import { NextResponse } from 'next/server'

export async function GET() {
  const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
        http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
        
  <!-- 메인 페이지 -->
  <url>
    <loc>https://dhoanjanjsep.github.io/dingco-vibecoding/</loc>
    <lastmod>2024-12-20</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  
  <!-- 기능 섹션 -->
  <url>
    <loc>https://dhoanjanjsep.github.io/dingco-vibecoding/#features</loc>
    <lastmod>2024-12-20</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  
  <!-- 설치 가이드 섹션 -->
  <url>
    <loc>https://dhoanjanjsep.github.io/dingco-vibecoding/#installation</loc>
    <lastmod>2024-12-20</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
  
  <!-- GitHub 리포지토리 -->
  <url>
    <loc>https://github.com/dhoanjanjsep/dingco-vibecoding</loc>
    <lastmod>2024-12-20</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  
  <!-- Figma 플러그인 페이지 -->
  <url>
    <loc>https://www.figma.com/community/plugin/1485687494525374295/cursor-talk-to-figma-mcp-plugin</loc>
    <lastmod>2024-12-20</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  
</urlset>`

  return new NextResponse(sitemap, {
    headers: {
      'Content-Type': 'application/xml',
    },
  })
}
