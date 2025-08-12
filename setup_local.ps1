# Quick Setup Script for AI ATS Resume Rater (PowerShell)
# This script automates the virtual environment setup and installation

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host " AI ATS Resume Rater - Quick Setup" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✅ Python detected: $pythonVersion" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Host "❌ ERROR: Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Python 3.8 or higher from:"
    Write-Host "https://www.python.org/downloads/"
    Write-Host ""
    Write-Host "Make sure to check 'Add Python to PATH' during installation"
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if we're in the correct directory
if (-not (Test-Path "app.py")) {
    Write-Host "❌ ERROR: app.py not found in current directory" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please make sure you're running this script from:"
    Write-Host "d:\Files\Coding Projects\ATS-Test"
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "📂 Project files found in current directory" -ForegroundColor Green
Write-Host ""

# Check execution policy
$executionPolicy = Get-ExecutionPolicy
if ($executionPolicy -eq "Restricted") {
    Write-Host "🔐 Setting execution policy for virtual environment activation..."
    try {
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
        Write-Host "✅ Execution policy updated" -ForegroundColor Green
    } catch {
        Write-Host "⚠️ Could not update execution policy. You may need to run as administrator." -ForegroundColor Yellow
    }
    Write-Host ""
}

# Create virtual environment if it doesn't exist
if (-not (Test-Path "ats_env")) {
    Write-Host "📦 Creating virtual environment 'ats_env'..." -ForegroundColor Yellow
    python -m venv ats_env
    Write-Host "✅ Virtual environment created" -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host "✅ Virtual environment 'ats_env' already exists" -ForegroundColor Green
    Write-Host ""
}

# Activate virtual environment
Write-Host "🔧 Activating virtual environment..." -ForegroundColor Yellow
try {
    & ".\ats_env\Scripts\Activate.ps1"
    Write-Host "✅ Virtual environment activated" -ForegroundColor Green
} catch {
    Write-Host "⚠️ Could not activate virtual environment with PowerShell" -ForegroundColor Yellow
    Write-Host "Trying alternative activation method..." -ForegroundColor Yellow
    & ".\ats_env\Scripts\activate.bat"
}
Write-Host ""

# Upgrade pip
Write-Host "⬆️ Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip --quiet

# Install requirements
Write-Host "📥 Installing requirements (this may take 5-10 minutes)..." -ForegroundColor Yellow
Write-Host "⏳ Downloading AI models and dependencies..." -ForegroundColor Yellow
Write-Host ""

$installResult = python -m pip install -r requirements.txt
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "❌ ERROR: Failed to install requirements" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please check your internet connection and try again."
    Write-Host "You can also try running manually:"
    Write-Host "  .\ats_env\Scripts\Activate.ps1"
    Write-Host "  pip install -r requirements.txt"
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "✅ All requirements installed successfully!" -ForegroundColor Green
Write-Host ""

# Run tests
Write-Host "🧪 Running basic functionality tests..." -ForegroundColor Yellow
$testResult = python test_app.py
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "⚠️ WARNING: Some tests failed, but you can still try running the app" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "      Setup Complete! 🎉" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Your AI ATS Resume Rater is ready to run!" -ForegroundColor Green
Write-Host ""
Write-Host "To start the application:" -ForegroundColor White
Write-Host "  1. Make sure virtual environment is activated" -ForegroundColor Gray
Write-Host "  2. Run: python app.py" -ForegroundColor Gray
Write-Host "  3. Open browser to: http://localhost:7860" -ForegroundColor Gray
Write-Host ""
Write-Host "Quick start commands for future use:" -ForegroundColor White
Write-Host "  .\ats_env\Scripts\Activate.ps1" -ForegroundColor Gray
Write-Host "  python app.py" -ForegroundColor Gray
Write-Host ""

# Ask if user wants to start the app now
$startApp = Read-Host "Would you like to start the application now? (y/n)"
if ($startApp -eq "y" -or $startApp -eq "Y" -or $startApp -eq "yes") {
    Write-Host ""
    Write-Host "🚀 Starting AI ATS Resume Rater..." -ForegroundColor Green
    Write-Host "🌐 Application will be available at http://localhost:7860" -ForegroundColor Green
    Write-Host "📱 Press Ctrl+C to stop the application" -ForegroundColor Yellow
    Write-Host ""
    python app.py
} else {
    Write-Host ""
    Write-Host "👋 Setup complete! Run the commands above when you're ready to start." -ForegroundColor Green
}

Write-Host ""
Read-Host "Press Enter to exit"
