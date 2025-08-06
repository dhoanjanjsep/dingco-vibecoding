# Windows PowerShell Setup Script for Cursor Talk to Figma MCP

# Check if bun is installed
function Test-BunInstalled {
    try {
        $null = Get-Command bun -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

# Install bun if not already installed
if (-not (Test-BunInstalled)) {
    Write-Host "Bun is not installed. Installing bun..." -ForegroundColor Yellow
    
    try {
        # Install bun using the official installer
        Invoke-RestMethod -Uri "https://bun.sh/install.ps1" | Invoke-Expression
        
        # Refresh environment variables
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
        
        Write-Host "Bun installed successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to install bun automatically. Please install bun manually:" -ForegroundColor Red
        Write-Host "1. Run PowerShell as Administrator" -ForegroundColor Yellow
        Write-Host "2. Execute: powershell -c `"irm bun.sh/install.ps1|iex`"" -ForegroundColor Yellow
        Write-Host "3. Restart your terminal and run this script again" -ForegroundColor Yellow
        exit 1
    }
}

# Verify bun is now available
if (-not (Test-BunInstalled)) {
    Write-Host "Bun is still not available. Please restart your terminal and try again." -ForegroundColor Red
    exit 1
}

Write-Host "Bun is available. Version: $(bun --version)" -ForegroundColor Green

# Create .cursor directory if it doesn't exist
if (!(Test-Path ".cursor")) {
    New-Item -ItemType Directory -Path ".cursor" -Force
    Write-Host "Created .cursor directory" -ForegroundColor Green
}

# Install dependencies using bun
Write-Host "Installing dependencies with bun..." -ForegroundColor Green
try {
    bun install
    Write-Host "Dependencies installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to install dependencies. Error: $_" -ForegroundColor Red
    exit 1
}

# Create mcp.json with the current directory path
$mcpConfig = @{
    mcpServers = @{
        TalkToFigma = @{
            command = "bunx"
            args = @("cursor-talk-to-figma-mcp@latest")
        }
    }
} | ConvertTo-Json -Depth 3

$mcpConfig | Out-File -FilePath ".cursor/mcp.json" -Encoding UTF8

Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "MCP configuration has been created at .cursor/mcp.json" -ForegroundColor Yellow
Write-Host "You can now start the websocket server with: bun socket" -ForegroundColor Cyan 