# One-Stop Windows PowerShell Installation and Setup Script for Cursor Talk to Figma MCP

Write-Host "=== Cursor Talk to Figma MCP - Complete Setup ===" -ForegroundColor Cyan
Write-Host "This script will install bun and set up the project automatically." -ForegroundColor Yellow

# Check if Node.js is installed
Write-Host "Checking Node.js installation..." -ForegroundColor Green
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js found: $nodeVersion" -ForegroundColor Green
}
catch {
    Write-Host "✗ Node.js is not installed. Please install Node.js first:" -ForegroundColor Red
    Write-Host "1. Download from: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "2. Install Node.js" -ForegroundColor Yellow
    Write-Host "3. Restart PowerShell and run this script again" -ForegroundColor Yellow
    exit 1
}

# Check if bun is already installed
Write-Host "Checking bun installation..." -ForegroundColor Green
try {
    $bunVersion = bun --version
    Write-Host "✓ Bun found: $bunVersion" -ForegroundColor Green
    $bunInstalled = $true
}
catch {
    Write-Host "✗ Bun not found. Installing bun..." -ForegroundColor Yellow
    $bunInstalled = $false
}

# Install bun if not already installed
if (-not $bunInstalled) {
    Write-Host "Installing bun..." -ForegroundColor Yellow
    
    # Try npm method first
    try {
        Write-Host "Trying npm installation method..." -ForegroundColor Gray
        npm install -g bun
        Write-Host "✓ Bun installed via npm!" -ForegroundColor Green
    }
    catch {
        Write-Host "npm installation failed. Trying official installer..." -ForegroundColor Yellow
        
        # Try official installer
        try {
            Invoke-RestMethod -Uri "https://bun.sh/install.ps1" | Invoke-Expression
            Write-Host "✓ Bun installed via official installer!" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ Failed to install bun automatically." -ForegroundColor Red
            Write-Host "Please install bun manually:" -ForegroundColor Yellow
            Write-Host "1. Run: npm install -g bun" -ForegroundColor White
            Write-Host "2. Or visit: https://bun.sh/docs/installation" -ForegroundColor White
            Write-Host "3. Restart your terminal and run this script again" -ForegroundColor White
            exit 1
        }
    }
    
    # Verify bun installation
    try {
        $bunVersion = bun --version
        Write-Host "✓ Bun installation verified: $bunVersion" -ForegroundColor Green
    }
    catch {
        Write-Host "✗ Bun installation verification failed. Please restart your terminal and try again." -ForegroundColor Red
        exit 1
    }
}

# Create .cursor directory
Write-Host "Setting up project structure..." -ForegroundColor Green
if (!(Test-Path ".cursor")) {
    New-Item -ItemType Directory -Path ".cursor" -Force | Out-Null
    Write-Host "✓ Created .cursor directory" -ForegroundColor Green
}
else {
    Write-Host "✓ .cursor directory already exists" -ForegroundColor Green
}

# Install project dependencies
Write-Host "Installing project dependencies..." -ForegroundColor Yellow
try {
    bun install
    Write-Host "✓ Dependencies installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "✗ Failed to install dependencies with bun. Trying npm..." -ForegroundColor Yellow
    try {
        npm install
        Write-Host "✓ Dependencies installed with npm!" -ForegroundColor Green
    }
    catch {
        Write-Host "✗ Failed to install dependencies. Error: $_" -ForegroundColor Red
        exit 1
    }
}

# Create MCP configuration
Write-Host "Creating MCP configuration..." -ForegroundColor Green
$mcpConfig = @{
    mcpServers = @{
        TalkToFigma = @{
            command = "bunx"
            args = @("cursor-talk-to-figma-mcp@latest")
        }
    }
} | ConvertTo-Json -Depth 3

$mcpConfig | Out-File -FilePath ".cursor/mcp.json" -Encoding UTF8
Write-Host "✓ MCP configuration created at .cursor/mcp.json" -ForegroundColor Green

# Success message
Write-Host "" -ForegroundColor White
Write-Host "=== Setup Completed Successfully! ===" -ForegroundColor Green
Write-Host "" -ForegroundColor White
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Start the websocket server: bun socket" -ForegroundColor White
Write-Host "2. Install the Figma plugin from the community page" -ForegroundColor White
Write-Host "3. Connect Cursor to Figma" -ForegroundColor White
Write-Host "" -ForegroundColor White
Write-Host "Figma plugin: https://www.figma.com/community/plugin/1485687494525374295/cursor-talk-to-figma-mcp-plugin" -ForegroundColor Yellow 