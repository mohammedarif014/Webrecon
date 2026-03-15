#!/bin/bash

# Quick Demo of Web Reconnaissance Tool
# This runs a quick scan against example.com (safe public domain)

echo "========================================="
echo "Web Reconnaissance Tool - Quick Demo"
echo "========================================="
echo ""
echo "Running quick scan against example.com..."
echo "This is a safe public domain for testing."
echo ""
echo "Press Ctrl+C to cancel at any time."
echo ""
sleep 2

python3 webrecon.py -t example.com -m quick -v

echo ""
echo "========================================="
echo "Demo completed!"
echo "========================================="
echo ""
echo "Try these next:"
echo "  - Standard scan: python3 webrecon.py -t example.com -m standard"
echo "  - Save to file: python3 webrecon.py -t example.com -f report.txt"
echo "  - JSON output: python3 webrecon.py -t example.com -o json"
echo ""
