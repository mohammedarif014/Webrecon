@echo off
setlocal DisableDelayedExpansion

echo =========================================
echo Web Reconnaissance Tool - Installation
echo =========================================
echo.

:: Check Python version
echo [*] Checking Python version...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Python is not installed or not in your PATH. Please install Python 3.8 or higher.
    exit /b 1
)
python --version

:: Check pip
echo [*] Checking pip...
python -m pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] pip is not installed. Please ensure pip is installed with Python.
    exit /b 1
)

:: Install dependencies
echo [*] Installing Python dependencies...
python -m pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [!] Installation failed with requirements.txt. Trying alternative method...
    python -m pip install requests dnspython colorama tldextract
)

:: Test installation
echo [*] Testing installation...
python webrecon.py -h >nul 2>&1
if %errorlevel% equ 0 (
    echo.
    echo =========================================
    echo [+] Installation completed successfully!
    echo =========================================
    echo.
    echo Quick start:
    echo   python webrecon.py -t example.com
    echo.
    echo For help:
    echo   python webrecon.py -h
    echo.
) else (
    echo.
    echo [!] Installation completed but there may be issues.
    echo [!] Try running: python webrecon.py -h
    echo.
)

endlocal
