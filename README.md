# massenum
A recon tool designed for pentesters working with large domain or IP scopes. It automates resolution, HTTP probing, subdomain enumeration, port scanning, tech fingerprinting, and screenshotting for up to hundreds of targets.

## Prerequisites
- subfinder
- dnsx
- httpx
- naabu
- assetfinder
- waybackurls
- gowitness

### If you are lazy there's a script in the repo that does it for you
[!] It requires Go to be installed

## 📁 Output Structure
recon_20260107_1530/
├── domains/
│   ├── domains.txt
│   ├── resolved.txt
├── ips/
│   └── ips.txt
├── subdomains/
│   ├── passive.txt
│   └── live.txt
├── ports/
│   ├── ip_ports.txt
│   └── domain_ports.txt
├── http/
│   ├── live_domains.txt
│   └── tech_info.txt
├── screenshots/
│   └── [screenshots]


