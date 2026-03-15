#!/bin/bash

# Example Usage Scripts for Web Reconnaissance Tool

echo "========================================="
echo "Web Reconnaissance Tool - Examples"
echo "========================================="
echo ""

echo "Example 1: Quick scan (passive only)"
echo "Command: python3 webrecon.py -t example.com -m quick"
echo ""

echo "Example 2: Standard scan with text output"
echo "Command: python3 webrecon.py -t example.com -m standard"
echo ""

echo "Example 3: Deep scan with verbose output"
echo "Command: python3 webrecon.py -t example.com -m deep -v"
echo ""

echo "Example 4: Save report to file"
echo "Command: python3 webrecon.py -t example.com -f report.txt"
echo ""

echo "Example 5: JSON output to file"
echo "Command: python3 webrecon.py -t example.com -o json -f report.json"
echo ""

echo "Example 6: Quick scan for bug bounty initial recon"
echo "Command: python3 webrecon.py -t target.com -m quick -f initial-recon.txt"
echo ""

echo "Example 7: Deep scan for protected target (Cloudflare bypass)"
echo "Command: python3 webrecon.py -t protected-site.com -m deep -v -f deep-scan.txt"
echo ""

echo "========================================="
echo "Try one of these commands!"
echo "========================================="
