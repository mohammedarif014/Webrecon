# Quick Reference - Cheat Sheet

## Installation
```bash
pip3 install -r requirements.txt --break-system-packages
chmod +x webrecon.py
```

## Basic Usage
```bash
# Quick scan
python3 webrecon.py -t example.com

# Standard scan
python3 webrecon.py -t example.com -m standard

# Deep scan
python3 webrecon.py -t example.com -m deep

# Verbose output
python3 webrecon.py -t example.com -v
```

## Output Options
```bash
# Save to file
python3 webrecon.py -t example.com -f report.txt

# JSON output
python3 webrecon.py -t example.com -o json

# JSON to file
python3 webrecon.py -t example.com -o json -f report.json
```

## Scan Modes

| Mode | Time | Features |
|------|------|----------|
| `quick` | 2-5 min | DNS, CT logs, protection detection |
| `standard` | 10-20 min | + ports, services, technologies |
| `deep` | 20-40 min | + origin IP discovery |

## Command Line Options

| Option | Description | Example |
|--------|-------------|---------|
| `-t, --target` | Target domain (required) | `-t example.com` |
| `-m, --mode` | Scan mode | `-m deep` |
| `-o, --output` | Output format | `-o json` |
| `-v, --verbose` | Verbose output | `-v` |
| `-f, --file` | Save to file | `-f report.txt` |
| `-h, --help` | Show help | `-h` |

## Verification Scores

| Component | Minimum Score | Checks |
|-----------|---------------|--------|
| Subdomain | 2/4 | DNS, IP consistency, HTTP, SSL |
| Port | 2/3 | Connection attempts |
| Technology | 50% | Indicator matching |

## Common Use Cases

### Bug Bounty Initial Recon
```bash
python3 webrecon.py -t target.com -m quick -f initial.txt
```

### Full Asset Discovery
```bash
python3 webrecon.py -t target.com -m standard -v -f full-scan.txt
```

### Protected Target (Cloudflare)
```bash
python3 webrecon.py -t target.com -m deep -v -f bypass.txt
```

### JSON for Automation
```bash
python3 webrecon.py -t target.com -o json | jq '.subdomains'
```

## Scanned Ports
- **Web:** 80, 443, 8080, 8443
- **Remote:** 22 (SSH), 23 (Telnet), 3389 (RDP)
- **Database:** 3306 (MySQL), 5432 (PostgreSQL)
- **Mail:** 25 (SMTP), 110 (POP3), 143 (IMAP)
- **Other:** 21 (FTP), 53 (DNS), 445 (SMB), 5900 (VNC)

## Protection Detection
- ✅ Cloudflare
- ✅ Akamai
- ✅ Sucuri
- ✅ Incapsula

## Technology Detection
- **CMS:** WordPress, Joomla, Drupal
- **Servers:** Apache, Nginx, IIS
- **Languages:** PHP, ASP.NET
- **Frameworks:** React, Vue.js, jQuery, Bootstrap

## Output Sections

**Text Report:**
1. DNS Records
2. Verified Subdomains
3. Open Ports
4. Detected Technologies
5. SSL/TLS Information
6. Security Headers
7. Protection Layer
8. Origin IP (if found)

**JSON Structure:**
```json
{
  "target": "...",
  "dns_records": {...},
  "subdomains": [...],
  "open_ports": {...},
  "technologies": {...},
  "ssl_info": {...},
  "security_headers": {...},
  "protection_detected": "...",
  "origin_ip": "..."
}
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Missing libraries | `pip3 install requests dnspython --break-system-packages` |
| Permission denied | `chmod +x webrecon.py` |
| DNS timeout | Check internet connection, try `-v` |
| Connection refused | Target may be down or blocking |

## Performance Tips
1. Use `quick` mode first
2. `standard` for most cases
3. `deep` only for protected targets
4. Save reports with `-f`
5. Use JSON for scripting

## Legal Notice
⚠️ **Only scan targets you own or have permission to test**
- Bug bounty programs (in scope)
- Authorized penetration testing
- Your own infrastructure

## Quick Help
```bash
python3 webrecon.py -h
./examples.sh
./demo.sh
```

---

**Version:** 1.0.0
**Author:** Mohammed Arif
**For detailed docs:** See README.md
