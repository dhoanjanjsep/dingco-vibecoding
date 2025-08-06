'use client'

import { useState } from 'react'

export default function Home() {
  const [activeTab, setActiveTab] = useState('windows')

  const showTab = (tabName: string) => {
    setActiveTab(tabName)
  }

  const copyCode = async (code: string) => {
    try {
      await navigator.clipboard.writeText(code)
      // 복사 성공 알림을 추가할 수 있습니다
    } catch (err) {
      console.error('Failed to copy code:', err)
    }
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-purple-600 via-blue-600 to-purple-800">
      {/* Header */}
      <header className="bg-white/95 backdrop-blur-lg shadow-lg sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-4">
            <div className="flex items-center space-x-2">
              <span className="text-2xl">🎨</span>
              <h1 className="text-2xl font-bold text-blue-600">Cursor Talk to Figma MCP</h1>
            </div>
            <nav className="hidden md:flex space-x-8">
              <a href="#features" className="text-gray-700 hover:text-blue-600 font-medium transition-colors">기능</a>
              <a href="#installation" className="text-gray-700 hover:text-blue-600 font-medium transition-colors">설치</a>
              <a href="https://github.com/dhoanjanjsep/dingco-vibecoding" className="text-gray-700 hover:text-blue-600 font-medium transition-colors">GitHub</a>
              <a href="https://www.figma.com/community/plugin/1485687494525374295/cursor-talk-to-figma-mcp-plugin" className="text-gray-700 hover:text-blue-600 font-medium transition-colors">Figma 플러그인</a>
            </nav>
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <section className="py-20 px-4">
        <div className="max-w-7xl mx-auto text-center">
          <div className="bg-white/90 rounded-3xl p-16 shadow-2xl">
            <h1 className="text-5xl md:text-6xl font-bold bg-gradient-to-r from-purple-600 to-blue-600 bg-clip-text text-transparent mb-6">
              AI로 Figma를 자동화하세요
            </h1>
            <p className="text-xl text-gray-600 mb-10 max-w-3xl mx-auto">
              Cursor AI와 Figma를 연결하여 디자인 작업을 혁신적으로 개선하는 Model Context Protocol 통합 도구입니다.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <a href="#installation" className="bg-gradient-to-r from-purple-600 to-blue-600 text-white px-8 py-4 rounded-full font-semibold hover:shadow-lg transform hover:-translate-y-1 transition-all">
                지금 시작하기
              </a>
              <a href="https://github.com/dhoanjanjsep/dingco-vibecoding" className="border-2 border-purple-600 text-purple-600 px-8 py-4 rounded-full font-semibold hover:bg-purple-600 hover:text-white transition-all">
                GitHub 보기
              </a>
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section id="features" className="py-20 px-4">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-4xl font-bold text-white text-center mb-16">주요 기능</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {[
              { icon: '🤖', title: 'AI 기반 디자인 읽기', desc: 'Cursor AI가 Figma 디자인을 이해하고 분석할 수 있습니다' },
              { icon: '✏️', title: '자동 요소 생성', desc: '텍스트, 프레임, 도형 등을 프로그래밍 방식으로 생성' },
              { icon: '🔄', title: '일괄 텍스트 변경', desc: '여러 텍스트 요소를 한 번에 업데이트' },
              { icon: '🎯', title: '컴포넌트 관리', desc: '컴포넌트 인스턴스 생성 및 속성 관리' },
              { icon: '📝', title: '어노테이션 지원', desc: '디자인에 주석과 설명을 자동으로 추가' },
              { icon: '🔗', title: '프로토타입 연결', desc: '인터랙션 플로우를 시각적으로 표현' }
            ].map((feature, index) => (
              <div key={index} className="bg-white/95 p-8 rounded-2xl text-center hover:transform hover:-translate-y-2 transition-all duration-300 shadow-lg">
                <div className="text-4xl mb-4">{feature.icon}</div>
                <h3 className="text-xl font-bold text-gray-800 mb-3">{feature.title}</h3>
                <p className="text-gray-600">{feature.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Installation Section */}
      <section id="installation" className="py-20 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="bg-white/95 rounded-3xl p-12 shadow-2xl">
            <h2 className="text-4xl font-bold text-gray-800 text-center mb-12">간편한 설치</h2>
            
            {/* Tab Buttons */}
            <div className="flex justify-center mb-8 space-x-4">
              <button
                onClick={() => showTab('windows')}
                className={`px-6 py-3 rounded-lg font-semibold transition-all ${
                  activeTab === 'windows'
                    ? 'bg-purple-600 text-white'
                    : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                }`}
              >
                Windows
              </button>
              <button
                onClick={() => showTab('mac')}
                className={`px-6 py-3 rounded-lg font-semibold transition-all ${
                  activeTab === 'mac'
                    ? 'bg-purple-600 text-white'
                    : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                }`}
              >
                macOS/Linux
              </button>
            </div>

            {/* Tab Content */}
            <div className="max-w-2xl mx-auto">
              {activeTab === 'windows' && (
                <div className="relative">
                  <button
                    onClick={() => copyCode(`# 원클릭 설치 (추천)
npm run install-and-setup

# 또는 수동 설치
powershell -c "irm bun.sh/install.ps1|iex"
bun run setup:windows-npm`)}
                    className="absolute top-4 right-4 bg-purple-600 text-white px-4 py-2 rounded text-sm hover:bg-purple-700 transition-colors"
                  >
                    복사
                  </button>
                  <pre className="bg-gray-900 text-green-400 p-8 rounded-lg overflow-x-auto text-sm">
{`# 원클릭 설치 (추천)
npm run install-and-setup

# 또는 수동 설치
powershell -c "irm bun.sh/install.ps1|iex"
bun run setup:windows-npm`}
                  </pre>
                </div>
              )}

              {activeTab === 'mac' && (
                <div className="relative">
                  <button
                    onClick={() => copyCode(`# bun 설치
curl -fsSL https://bun.sh/install | bash

# 프로젝트 설정
bun setup

# 웹소켓 서버 시작
bun socket`)}
                    className="absolute top-4 right-4 bg-purple-600 text-white px-4 py-2 rounded text-sm hover:bg-purple-700 transition-colors"
                  >
                    복사
                  </button>
                  <pre className="bg-gray-900 text-green-400 p-8 rounded-lg overflow-x-auto text-sm">
{`# bun 설치
curl -fsSL https://bun.sh/install | bash

# 프로젝트 설정
bun setup

# 웹소켓 서버 시작
bun socket`}
                  </pre>
                </div>
              )}
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-black/80 text-white text-center py-12 mt-20">
        <div className="max-w-7xl mx-auto px-4">
          <p>&copy; 2024 Cursor Talk to Figma MCP. MIT License.</p>
          <p className="mt-2">Made with ❤️ for the design automation community</p>
        </div>
      </footer>
    </main>
  )
}
