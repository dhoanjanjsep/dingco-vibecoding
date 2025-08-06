# Windows PowerShell Setup Script using npm for Cursor Talk to Figma MCP

Write-Host "=== Cursor Talk to Figma MCP Setup (npm version) ===" -ForegroundColor Cyan

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

# Create .cursor directory
if (!(Test-Path ".cursor")) {
    New-Item -ItemType Directory -Path ".cursor" -Force
    Write-Host "Created .cursor directory" -ForegroundColor Green
}

# Install project dependencies using npm
Write-Host "Installing project dependencies with npm..." -ForegroundColor Yellow
try {
    npm install
    Write-Host "Dependencies installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to install dependencies. Error: $_" -ForegroundColor Red
    exit 1
}

# Install bun globally for MCP functionality
Write-Host "Installing bun globally for MCP functionality..." -ForegroundColor Yellow
try {
    npm install -g bun
    Write-Host "Bun installed globally!" -ForegroundColor Green
}
catch {
    Write-Host "Warning: Failed to install bun globally. MCP may not work properly." -ForegroundColor Yellow
    Write-Host "You can try installing bun manually later." -ForegroundColor Yellow
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
Write-Host "1. Start the websocket server: npm run socket" -ForegroundColor White
Write-Host "2. Install the Figma plugin" -ForegroundColor White
Write-Host "3. Connect Cursor to Figma" -ForegroundColor White
Write-Host "" -ForegroundColor White
Write-Host "Note: If bun is not available, you may need to install it manually:" -ForegroundColor Yellow
Write-Host "npm install -g bun" -ForegroundColor White 