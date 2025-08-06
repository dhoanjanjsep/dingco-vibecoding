# Simple Windows PowerShell Setup Script for Cursor Talk to Figma MCP

Write-Host "=== Cursor Talk to Figma MCP Setup ===" -ForegroundColor Cyan

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "Node.js found: $nodeVersion" -ForegroundColor Green
}
catch {
    Write-Host "Node.js is not installed. Please install Node.js first:" -ForegroundColor Red
    Write-Host "1. Download from: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "2. Install Node.js" -ForegroundColor Yellow
    Write-Host "3. Restart PowerShell and run this script again" -ForegroundColor Yellow
    exit 1
}

# Check if npm is available
try {
    $npmVersion = npm --version
    Write-Host "npm found: $npmVersion" -ForegroundColor Green
}
catch {
    Write-Host "npm is not available. Please check your Node.js installation." -ForegroundColor Red
    exit 1
}

# Install bun globally using npm
Write-Host "Installing bun using npm..." -ForegroundColor Yellow
try {
    npm install -g bun
    Write-Host "Bun installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to install bun. Trying alternative method..." -ForegroundColor Yellow
    
    # Alternative: Use the official installer
    try {
        Invoke-RestMethod -Uri "https://bun.sh/install.ps1" | Invoke-Expression
        Write-Host "Bun installed using official installer!" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to install bun. Please install manually:" -ForegroundColor Red
        Write-Host "1. Run: npm install -g bun" -ForegroundColor Yellow
        Write-Host "2. Or visit: https://bun.sh/docs/installation" -ForegroundColor Yellow
        exit 1
    }
}

# Create .cursor directory
if (!(Test-Path ".cursor")) {
    New-Item -ItemType Directory -Path ".cursor" -Force
    Write-Host "Created .cursor directory" -ForegroundColor Green
}

# Install project dependencies
Write-Host "Installing project dependencies..." -ForegroundColor Yellow
try {
    bun install
    Write-Host "Dependencies installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to install dependencies with bun. Trying with npm..." -ForegroundColor Yellow
    try {
        npm install
        Write-Host "Dependencies installed with npm!" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to install dependencies. Error: $_" -ForegroundColor Red
        exit 1
    }
}

# Create MCP configuration
$mcpConfig = @{
    mcpServers = @{
        TalkToFigma = @{
            command = "bunx"
            args = @("cursor-talk-to-figma-mcp@latest")
        }
    }
} | ConvertTo-Json -Depth 3

$mcpConfig | Out-File -FilePath ".cursor/mcp.json" -Encoding UTF8

Write-Host "=== Setup Completed Successfully! ===" -ForegroundColor Green
Write-Host "MCP configuration created at: .cursor/mcp.json" -ForegroundColor Yellow
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Start the websocket server: bun socket" -ForegroundColor White
Write-Host "2. Install the Figma plugin" -ForegroundColor White
Write-Host "3. Connect Cursor to Figma" -ForegroundColor White 