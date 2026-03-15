#!/bin/bash

# Advanced Web Reconnaissance Tool - Installation Script
# Author: Mohammed Arif

echo "========================================="
echo "Web Reconnaissance Tool - Installation"
echo "========================================="
echo ""

# Check Python version
echo "[*] Checking Python version..."
python3 --version

if [ $? -ne 0 ]; then
    echo "[!] Python3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Check pip
echo "[*] Checking pip3..."
pip3 --version

if [ $? -ne 0 ]; then
    echo "[!] pip3 is not installed. Installing..."
    sudo apt update
    sudo apt install python3-pip -y
fi

# Install dependencies
echo "[*] Installing Python dependencies..."
pip3 install -r requirements.txt --break-system-packages

if [ $? -ne 0 ]; then
    echo "[!] Installation failed. Trying alternative method..."
    pip3 install requests dnspython colorama tldextract --break-system-packages
fi

# Make executable
echo "[*] Making script executable..."
chmod +x webrecon.py

# Test installation
echo "[*] Testing installation..."
python3 webrecon.py -h > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "[+] Installation completed successfully!"
    echo "========================================="
    echo ""
    echo "Quick start:"
    echo "  python3 webrecon.py -t example.com"
    echo ""
    echo "For help:"
    echo "  python3 webrecon.py -h"
    echo ""
else
    echo ""
    echo "[!] Installation completed but there may be issues."
    echo "[!] Try running: python3 webrecon.py -h"
    echo ""
fi
