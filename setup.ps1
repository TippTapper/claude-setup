# Claude Code - Auto Setup Script
# Kör detta i PowerShell som administratör:
# .\setup.ps1

Write-Host ""
Write-Host "=== Claude Code Setup ===" -ForegroundColor Cyan
Write-Host ""

# 1. Kontrollera Node.js
Write-Host "[1/4] Kollar Node.js..." -ForegroundColor Yellow
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js saknas! Installera det fran: https://nodejs.org" -ForegroundColor Red
    Write-Host "Kör scriptet igen efter installation."
    exit 1
}
Write-Host "Node.js OK: $(node --version)" -ForegroundColor Green

# 2. Installera Claude Code
Write-Host ""
Write-Host "[2/4] Installerar Claude Code..." -ForegroundColor Yellow
npm install -g @anthropic-ai/claude-code
Write-Host "Claude Code installerat!" -ForegroundColor Green

# 3. Skapa skills-mapp
Write-Host ""
Write-Host "[3/4] Skapar skills-mapp och klonar repos..." -ForegroundColor Yellow
$skillsPath = "$env:USERPROFILE\.claude\skills"
if (-not (Test-Path $skillsPath)) {
    New-Item -ItemType Directory -Path $skillsPath | Out-Null
}

$repos = @(
    "https://github.com/obra/superpowers.git",
    "https://github.com/KhazP/vibe-coding-prompt-template.git",
    "https://github.com/thedotmack/claude-mem.git",
    "https://github.com/anthropics/skills.git"
)

foreach ($repo in $repos) {
    $name = ($repo -split "/")[-1] -replace "\.git$", ""
    $dest = Join-Path $skillsPath $name
    if (Test-Path $dest) {
        Write-Host "  $name finns redan, uppdaterar..." -ForegroundColor Gray
        git -C $dest pull
    } else {
        Write-Host "  Klonar $name..." -ForegroundColor Gray
        git clone $repo $dest
    }
}
Write-Host "Skills klonade!" -ForegroundColor Green

# 4. Klart
Write-Host ""
Write-Host "[4/4] Klart! Starta Claude Code och kör:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  /plugin marketplace add anthropics/skills" -ForegroundColor White
Write-Host "  /plugin install example-skills@anthropic-agent-skills" -ForegroundColor White
Write-Host "  /plugin install document-skills@anthropic-agent-skills" -ForegroundColor White
Write-Host "  /reload-plugins" -ForegroundColor White
Write-Host ""
Write-Host "=== Setup klar! ===" -ForegroundColor Cyan
