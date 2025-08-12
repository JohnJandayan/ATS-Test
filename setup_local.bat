@echo off
REM Quick Setup Script for AI ATS Resume Rater (Windows)
REM This script automates the virtual environment setup and installation

echo.
echo =====================================
echo  AI ATS Resume Rater - Quick Setup
echo =====================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ERROR: Python is not installed or not in PATH
    echo.
    echo Please install Python 3.8 or higher from:
    echo https://www.python.org/downloads/
    echo.
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

REM Display Python version
echo ✅ Python detected:
python --version
echo.

REM Check if we're in the correct directory
if not exist "app.py" (
    echo ❌ ERROR: app.py not found in current directory
    echo.
    echo Please make sure you're running this script from:
    echo d:\Files\Coding Projects\ATS-Test
    echo.
    pause
    exit /b 1
)

echo 📂 Project files found in current directory
echo.

REM Create virtual environment if it doesn't exist
if not exist "ats_env" (
    echo 📦 Creating virtual environment 'ats_env'...
    python -m venv ats_env
    echo ✅ Virtual environment created
    echo.
) else (
    echo ✅ Virtual environment 'ats_env' already exists
    echo.
)

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call ats_env\Scripts\activate.bat

REM Upgrade pip
echo ⬆️ Upgrading pip...
python -m pip install --upgrade pip --quiet

REM Install requirements
echo 📥 Installing requirements (this may take 5-10 minutes)...
echo ⏳ Downloading AI models and dependencies...
pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo.
    echo ❌ ERROR: Failed to install requirements
    echo.
    echo Please check your internet connection and try again.
    echo You can also try running manually:
    echo   ats_env\Scripts\activate.bat
    echo   pip install -r requirements.txt
    pause
    exit /b 1
)

echo.
echo ✅ All requirements installed successfully!
echo.

REM Run tests
echo 🧪 Running basic functionality tests...
python test_app.py

if %errorlevel% neq 0 (
    echo.
    echo ⚠️ WARNING: Some tests failed, but you can still try running the app
    echo.
)

echo.
echo =====================================
echo       Setup Complete! 🎉
echo =====================================
echo.
echo Your AI ATS Resume Rater is ready to run!
echo.
echo To start the application:
echo   1. Make sure virtual environment is activated
echo   2. Run: python app.py
echo   3. Open browser to: http://localhost:7860
echo.
echo Quick start commands for future use:
echo   ats_env\Scripts\activate.bat
echo   python app.py
echo.

REM Ask if user wants to start the app now
set /p start_app="Would you like to start the application now? (y/n): "
if /i "%start_app%"=="y" (
    echo.
    echo 🚀 Starting AI ATS Resume Rater...
    echo 🌐 Application will be available at http://localhost:7860
    echo 📱 Press Ctrl+C to stop the application
    echo.
    python app.py
) else (
    echo.
    echo 👋 Setup complete! Run the commands above when you're ready to start.
)

echo.
pause
