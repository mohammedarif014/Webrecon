# Advanced Web Reconnaissance Tool

**High Accuracy | Zero False Positives | Command Line Interface**

A professional-grade web reconnaissance tool designed for bug bounty hunters and security researchers. Built with multi-stage verification to ensure zero false positives.

---

## 🎯 Features

### **Core Capabilities**
-  **Multi-Stage Verification** - Every finding verified through 3+ independent checks
-  **Zero False Positives** - Intelligent filtering eliminates unreliable results
-  **Protection Layer Detection** - Identifies Cloudflare, Akamai, Sucuri, Incapsula
-  **Origin IP Discovery** - Attempts to find real server behind CDN/WAF
-  **Comprehensive Reporting** - Text and JSON output formats

### **Reconnaissance Modules**

#### **Passive Reconnaissance (No Direct Contact)**
- DNS enumeration (A, AAAA, MX, NS, TXT, SOA, CNAME)
- Certificate Transparency log mining
- Subdomain discovery with verification
- Protection layer fingerprinting

#### **Active Reconnaissance (Direct Scanning)**
- Multi-verification port scanning (21, 22, 23, 25, 53, 80, 443, 3306, 5432, 8080, 8443)
- Service fingerprinting with banner grabbing
- Web technology detection (CMS, frameworks, servers)
- SSL/TLS analysis (certificates, cipher suites, versions)
- Security headers assessment
- Origin IP discovery for protected targets

---

## Installation ##

### **Prerequisites**
- Python 3.8+
- pip3

### **Quick Install (Linux/macOS)**
```bash
# Clone or download the tool
cd webrecon/

# Install dependencies (might need --break-system-packages on newer Linux distros)
pip3 install -r requirements.txt

# Make executable
chmod +x webrecon.py
```

### **Quick Install (Windows)**
```cmd
# Navigate to the tool directory
cd webrecon

# Run the installation batch script
install.bat
```

### **Manual Install**
```bash
# Linux/macOS
python3 -m pip install requests dnspython colorama

# Windows
python -m pip install requests dnspython colorama
```

---

## Usage ##

### **Basic Commands**

```bash
# Quick scan (passive only)
python webrecon.py -t example.com

# *Note: Substitute `python` for `python3` if you are on Linux/macOS*

# Standard scan (passive + active)
python3 webrecon.py -t example.com -m standard

# Deep scan (includes origin IP discovery)
python3 webrecon.py -t example.com -m deep

# Verbose output
python3 webrecon.py -t example.com -m deep -v

# JSON output
python3 webrecon.py -t example.com -o json

# Save report to file
python3 webrecon.py -t example.com -f report.txt

# JSON to file
python3 webrecon.py -t example.com -o json -f report.json
```

### **Scan Modes**

| Mode | Duration | Description |
|------|----------|-------------|
| `quick` | 2-5 min | Passive reconnaissance only (DNS, CT logs, protection detection) |
| `standard` | 10-20 min | Passive + Active (ports, services, technologies, SSL) |
| `deep` | 20-40 min | Everything + Origin IP discovery for protected targets |

---

## Verification Mechanisms ##

### **Subdomain Verification (3+ Checks Required)**
1.  DNS resolution across multiple resolvers (Google, Cloudflare, OpenDNS)
2.  Consistent IP addresses across resolvers
3.  HTTP/HTTPS accessibility test
4.  SSL certificate validation

### **Port Verification (Majority Vote)**
1. 3 connection attempts to each port
2.  Banner grabbing for service confirmation
3.  Response time analysis

### **Technology Verification (50%+ Indicators)**
1.  Multiple signature matching in headers
2.  HTML/JavaScript pattern detection
3.  Confidence scoring system

---

##  Output Examples ##

### **Text Output**
```
================================================================================
WEB RECONNAISSANCE REPORT
================================================================================

Target: example.com
Base Domain: example.com
Scan Started: 2026-03-15T10:30:00
Scan Completed: 2026-03-15T10:45:23

[DNS RECORDS]
--------------------------------------------------------------------------------
A:
  → 93.184.216.34
MX:
  → 10 mail.example.com
NS:
  → ns1.example.com
  → ns2.example.com

[VERIFIED SUBDOMAINS] (Total: 5)
--------------------------------------------------------------------------------
✓ www.example.com
  Score: 4 | IPs: 93.184.216.34
✓ mail.example.com
  Score: 3 | IPs: 93.184.216.50

[OPEN PORTS] (Total: 3)
--------------------------------------------------------------------------------
✓ Port 80/HTTP
✓ Port 443/HTTPS
✓ Port 22/SSH
  Banner: SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.5

[DETECTED TECHNOLOGIES]
--------------------------------------------------------------------------------
✓ Nginx (Confidence: 85.0%)
✓ PHP (Confidence: 75.0%)
✓ jQuery (Confidence: 90.0%)

[SSL/TLS INFORMATION]
--------------------------------------------------------------------------------
Version: TLSv1.3
Issuer: Let's Encrypt
Valid From: 2026-01-15 00:00:00
Valid Until: 2026-04-15 23:59:59

[SECURITY HEADERS]
--------------------------------------------------------------------------------
Score: 57.1%

Found:
  ✓ Strict-Transport-Security
  ✓ X-Content-Type-Options
  ✓ X-Frame-Options

Missing:
  ✗ Content-Security-Policy
  ✗ X-XSS-Protection
  ✗ Referrer-Policy
```

### **JSON Output**
```json
{
  "target": "example.com",
  "base_domain": "example.com",
  "scan_start": "2026-03-15T10:30:00",
  "scan_end": "2026-03-15T10:45:23",
  "dns_records": {
    "A": ["93.184.216.34"],
    "MX": ["10 mail.example.com"],
    "NS": ["ns1.example.com", "ns2.example.com"]
  },
  "subdomains": [
    {
      "subdomain": "www.example.com",
      "verified": true,
      "verification_score": 4,
      "ip_addresses": ["93.184.216.34"],
      "source": "certificate_transparency"
    }
  ],
  "open_ports": {
    "80": {
      "service": "HTTP",
      "verified": true,
      "banner": null,
      "response_time": 0.023
    },
    "443": {
      "service": "HTTPS",
      "verified": true,
      "banner": null,
      "response_time": 0.034
    }
  },
  "technologies": {
    "Nginx": {
      "confidence": 85.0,
      "verified": true
    }
  },
  "protection_detected": null,
  "origin_ip": null
}
```

---

## 🛡️ Protection Layer Handling

### **Supported Protection Detection**
-  Cloudflare
-  Akamai
-  Sucuri
-  Incapsula

### **Origin IP Discovery Methods**
When protection is detected, the tool attempts:
1. Historical DNS record analysis
2. Subdomain enumeration for unprotected IPs
3. Certificate scanning across IP space
4. Email header analysis
5. Direct IP verification with Host header

---

## 🎓 Use Cases

### **For Bug Bounty Hunters**
- Comprehensive asset discovery
- Technology stack identification
- Attack surface mapping
- Verified subdomain enumeration

### **For Penetration Testers**
- Initial reconnaissance phase
- Service enumeration
- SSL/TLS security assessment
- Origin server identification

### **For Security Researchers**
- Infrastructure analysis
- Protection layer identification
- Technology fingerprinting
- Vulnerability surface mapping

---

##  Legal & Ethical Usage ##

**IMPORTANT:** This tool is for **authorized security testing only**.

 **Permitted Uses:**
- Bug bounty programs (within scope)
- Authorized penetration testing
- Your own infrastructure
- Educational purposes on test environments

 **Prohibited Uses:**
- Unauthorized scanning of third-party systems
- Malicious reconnaissance
- Violation of terms of service
- Any illegal activities

**Always obtain explicit permission before scanning any target you don't own.**

---

##  Advanced Configuration

### **Customizing Verification Thresholds**

Edit `webrecon.py` and modify:

```python
# Subdomain verification (line ~140)
is_valid, verify_data = self.verification_engine.verify_subdomain(
    subdomain, self.base_domain, min_checks=2  # Change from 2 to 3 for stricter
)

# Port verification (line ~500)
is_open, verify_data = self.verification_engine.verify_open_port(
    target_ip, port, retries=3  # Increase for more accuracy
)
```

### **Adding Custom Ports**

```python
# Port scanning section (line ~485)
common_ports = {
    21: 'FTP',
    22: 'SSH',
    3000: 'Node.js',  # Add custom port
    5000: 'Flask',    # Add custom port
    # ... existing ports
}
```

---

##  Command Reference

```bash
Options:
  -h, --help            Show help message
  -t, --target TARGET   Target domain or IP (required)
  -m, --mode MODE       Scan mode: quick|standard|deep (default: standard)
  -o, --output FORMAT   Output format: text|json (default: text)
  -v, --verbose         Enable verbose output
  -f, --file FILE       Save report to file
```

---

##  Troubleshooting

### **Common Issues**

**"Missing requests library" / "Missing dnspython library"**
```bash
python -m pip install -r requirements.txt
# or manually
python -m pip install requests dnspython colorama
```

**"Permission denied" (Linux/macOS)**
```bash
chmod +x webrecon.py
```

**"DNS resolution failed"**
- Check internet connection
- Try with verbose flag: `-v`
- Verify target domain is valid

**"Connection timeout"**
- Target may be down or blocking requests
- Increase timeout in code (line ~245)
- Use VPN if IP is blocked

---

##  Performance Tips

1. **Quick scans for initial recon**: Use `-m quick` first
2. **Standard for most cases**: Default mode balances speed/depth
3. **Deep only when needed**: Use for protected targets
4. **JSON for automation**: Use `-o json` for scripting
5. **Save reports**: Always use `-f` to keep records

---

##  Security & Privacy

- **No data collection**: Tool runs entirely locally
- **No API keys required**: Works without external accounts (except optional APIs)
- **No logging**: No persistent logs created (except your saved reports)
- **Rate limiting**: Built-in delays to avoid detection/blocking

---

##  Future Enhancements

- [ ] Shodan/Censys API integration
- [ ] Historical DNS data queries
- [ ] Automated exploit matching
- [ ] Web application firewall bypass testing
- [ ] JavaScript reconnaissance
- [ ] API endpoint discovery
- [ ] Continuous monitoring mode
- [ ] HTML report generation with graphs

---

##  Author ##

**Mohammed Arif**
- Security Researcher & Bug Hunter
- Bug Bounty: Bugcrowd, YesWeHack

---

##  License ##

This tool is provided for educational and authorized security testing purposes only.
Users are responsible for compliance with applicable laws and regulations.

---

## Acknowledgments ##

Built for the bug bounty and security research community.

**Happy Hunting! 🎯**
