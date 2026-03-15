# Project Structure

```
webrecon/
│
├── webrecon.py              # Main reconnaissance tool (CLI)
├── requirements.txt         # Python dependencies
├── install.sh              # Installation script
├── demo.sh                 # Quick demo script
├── examples.sh             # Usage examples
│
├── README.md               # Comprehensive documentation
├── CHANGELOG.md            # Version history and features
└── PROJECT_STRUCTURE.md    # This file
```

---

## File Descriptions

### **webrecon.py** (Main Tool)
**Size:** ~30KB | **Lines:** ~900
**Purpose:** Core reconnaissance engine with CLI interface

**Key Components:**
1. **VerificationEngine Class** (Lines 50-200)
   - `verify_subdomain()` - Multi-resolver DNS verification
   - `verify_open_port()` - Port scanning with retries
   - `verify_technology()` - Technology fingerprinting

2. **ReconEngine Class** (Lines 200-850)
   - Passive reconnaissance methods
   - Active reconnaissance methods
   - Protection detection
   - Origin IP discovery
   - Report generation

3. **Main CLI Interface** (Lines 850-900)
   - Argument parsing
   - Scan execution
   - Error handling

**Features:**
- Multi-stage verification (zero false positives)
- Colored CLI output
- JSON and text reports
- Verbose debugging
- Graceful error handling

---

### **requirements.txt**
**Purpose:** Python package dependencies

```
requests>=2.31.0
dnspython>=2.4.2
urllib3>=2.0.7
```

---

### **install.sh**
**Purpose:** Automated installation script

**What it does:**
1. Checks Python 3 installation
2. Checks pip3 availability
3. Installs dependencies
4. Makes webrecon.py executable
5. Tests installation

**Usage:**
```bash
chmod +x install.sh
./install.sh
```

---

### **demo.sh**
**Purpose:** Quick demonstration script

**What it does:**
- Runs quick scan against example.com
- Shows tool capabilities
- Safe public domain testing

**Usage:**
```bash
chmod +x demo.sh
./demo.sh
```

---

### **examples.sh**
**Purpose:** Display usage examples

**Shows:**
- Quick scan example
- Standard scan example
- Deep scan with verbose
- File output examples
- JSON output examples
- Bug bounty workflow examples

**Usage:**
```bash
./examples.sh
```

---

### **README.md**
**Purpose:** Comprehensive user documentation

**Sections:**
1. Features overview
2. Installation instructions
3. Usage guide
4. Scan modes explained
5. Verification mechanisms
6. Output examples
7. Protection layer handling
8. Legal & ethical usage
9. Troubleshooting
10. Performance tips

**Target Audience:**
- Bug bounty hunters
- Penetration testers
- Security researchers
- Students

---

### **CHANGELOG.md**
**Purpose:** Version history and feature tracking

**Content:**
- Version 1.0.0 features
- Technical details
- Verification thresholds
- Supported technologies
- Dependencies
- Future roadmap

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                    CLI INTERFACE                        │
│              (Argument Parsing & Display)               │
└─────────────────────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│                  RECONNAISSANCE ENGINE                  │
│  ┌────────────────────────────────────────────────┐    │
│  │         PASSIVE RECONNAISSANCE                  │    │
│  │  • DNS Enumeration                             │    │
│  │  • Certificate Transparency                    │    │
│  │  • Protection Detection                        │    │
│  └────────────────────────────────────────────────┘    │
│                         │                               │
│  ┌────────────────────────────────────────────────┐    │
│  │         ACTIVE RECONNAISSANCE                   │    │
│  │  • Port Scanning                               │    │
│  │  • Service Fingerprinting                      │    │
│  │  • Technology Detection                        │    │
│  │  • SSL/TLS Analysis                            │    │
│  │  • Security Headers                            │    │
│  └────────────────────────────────────────────────┘    │
│                         │                               │
│  ┌────────────────────────────────────────────────┐    │
│  │         VERIFICATION ENGINE                     │    │
│  │  • Multi-Resolver DNS                          │    │
│  │  • Port Retry Logic                            │    │
│  │  • Confidence Scoring                          │    │
│  │  • False Positive Elimination                  │    │
│  └────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│                  REPORT GENERATION                      │
│         (Text Format / JSON Format)                     │
└─────────────────────────────────────────────────────────┘
```

---

## Data Flow

```
USER INPUT (Target Domain)
    │
    ▼
TARGET NORMALIZATION
    │
    ▼
SCAN MODE SELECTION (Quick/Standard/Deep)
    │
    ▼
┌─────────────────────────┐
│   PASSIVE RECON         │
│  • DNS Queries          │
│  • CT Log Search        │
│  • Protection Check     │
└─────────────────────────┘
    │
    ▼
VERIFICATION LAYER
    │
    ▼
┌─────────────────────────┐
│   ACTIVE RECON          │
│  • Port Scan            │
│  • Service Detect       │
│  • Tech Fingerprint     │
└─────────────────────────┘
    │
    ▼
VERIFICATION LAYER
    │
    ▼
DATA AGGREGATION
    │
    ▼
REPORT GENERATION
    │
    ▼
OUTPUT (File/Screen)
```

---

## Verification Flow

```
FINDING (e.g., Subdomain)
    │
    ▼
CHECK 1: DNS Resolution (Multiple Resolvers)
    ├─ Google DNS (8.8.8.8)
    ├─ Cloudflare DNS (1.1.1.1)
    └─ OpenDNS (208.67.222.222)
    │
    ▼
CHECK 2: IP Consistency
    └─ Do all resolvers agree?
    │
    ▼
CHECK 3: HTTP Accessibility
    └─ Can we connect via HTTP/HTTPS?
    │
    ▼
CHECK 4: SSL Certificate Validation
    └─ Does cert match domain?
    │
    ▼
SCORE CALCULATION
    │
    ▼
THRESHOLD CHECK (Min 2/4 checks)
    │
    ├─ PASS → Add to verified results
    └─ FAIL → Discard (false positive)
```

---

## Key Design Decisions

### **1. Zero False Positives Priority**
- Multi-stage verification for every finding
- Minimum threshold scoring
- Majority vote for uncertain results

### **2. Performance Optimization**
- Session reuse with connection pooling
- Retry strategy with exponential backoff
- Concurrent DNS lookups
- Intelligent timeouts

### **3. Stealth Considerations**
- Rate limiting between requests
- Legitimate User-Agent strings
- DNS over multiple resolvers
- Respect for robots.txt

### **4. Extensibility**
- Modular architecture
- Easy to add new verification methods
- Plugin-ready structure
- Custom threshold configuration

### **5. User Experience**
- Colored terminal output
- Progress indicators
- Verbose mode for debugging
- Multiple output formats
- Clear error messages

---

## Security Considerations

### **Input Validation**
- Domain format validation
- Protocol stripping
- Path removal
- Port removal

### **Network Safety**
- SSL verification disabled (for reconnaissance)
- Timeout enforcement
- Connection pooling limits
- Error handling for all network calls

### **Data Privacy**
- No persistent logging
- No external data transmission
- Local-only execution
- User controls all output

---

## Testing Strategy

### **Unit Tests** (To be added)
- Verification engine tests
- DNS resolution tests
- Port scanning tests
- Technology detection tests

### **Integration Tests** (To be added)
- Full scan workflow
- Output format validation
- Error handling scenarios

### **Manual Testing**
- Test against example.com (safe public domain)
- Various scan modes
- Output formats
- Error conditions

---

## Future Enhancements

### **Phase 2 Features**
- [ ] Shodan API integration
- [ ] Censys API integration
- [ ] Historical DNS data
- [ ] Favicon hash matching
- [ ] Email header analysis

### **Phase 3 Features**
- [ ] Directory fuzzing
- [ ] JavaScript reconnaissance
- [ ] API endpoint discovery
- [ ] HTML report with graphs
- [ ] Continuous monitoring

### **Phase 4 Features**
- [ ] Custom plugin system
- [ ] Webhook notifications
- [ ] Database storage
- [ ] Multi-target scanning
- [ ] Collaboration features

---

## Contributing Guidelines

### **Code Style**
- PEP 8 compliance
- Type hints for functions
- Docstrings for classes/methods
- Meaningful variable names
- Comments for complex logic

### **Git Workflow**
- Feature branches
- Descriptive commit messages
- Pull request reviews
- Version tagging

### **Documentation**
- Update README for new features
- Update CHANGELOG for versions
- Add inline comments
- Include usage examples

---

## Support & Resources

### **Documentation**
- README.md - Main documentation
- CHANGELOG.md - Version history
- Examples.sh - Usage examples

### **Community**
- Bug reports via issues
- Feature requests via issues
- Security vulnerabilities (private disclosure)

---

**Last Updated:** March 15, 2026
**Version:** 1.0.0
**Author:** Mohammed Arif
