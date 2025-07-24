# 🤖🔪 Swiss_HArmy_Knife 🗡️👨‍💻
---
A full-featured, containerized offensive security toolkit built for Kali Linux. 
This toolkit automates recon, enumeration, and vulnerability scanning across web targets. 
Perfect for internal testing, bug bounty hunting, and red team workflows.
Swiss_HArmy_Knife_OTW (Paid Online Version) [Coming Soon...]
---

## 🔥 Features

### ✅ CLI-Driven, Containerized
Run a full suite of recon and vulnerability tools from a single command inside a secure Docker container.

### 🌐 Recon Tools
- `amass` – Subdomain enumeration  
- `whatweb` – Web tech fingerprinting  
- `ping`, `traceroute` – Basic network visibility  

### 🔓 Vulnerability Scanners
- `nuclei` – Template-based scanning  
- `nikto` – Web vulnerability scanner  
- `wpscan` – WordPress vulnerability checks  

### 🛠 Brute Force & Fuzzing
- `hydra` – Login brute-force  
- `ffuf` – URL fuzzing  

### 📊 Reporting
- Auto-generated `.json`, `.html`, and `.pdf` reports  
- Output organized by scan category  

---

## ⚙️ Requirements

- Kali Linux (tested on 2023.3 and later)  
- Docker installed:
  ```bash
  sudo apt install docker.io
Internet connection for full recon functionality

⚠️ Note: Some tools may require manual installation on newer Kali or WSL setups.

## 🚀 Quick Start
1. Clone the Repo
bash
Copy
Edit
git clone https://github.com/Sudocod3r/Swiss_HArmy_Knife
cd Swiss_HArmy_Knife
2. Create the Results Directory
Before running scans, create the output directory:

bash
Copy
Edit
mkdir results
3. Build the Docker Image
bash
Copy
Edit
sudo docker build -t swiss-harmy-knife -f Dockerfile .
4. Run the Toolkit on a Target
bash
Copy
Edit
sudo docker run --privileged --rm -v "$PWD:/app" -it swiss-harmy-knife \
  http://example.com \
  --ping \
  --traceroute \
  --headers \
  --whatweb \
  --subdomains \
  --ports \
  --ffuf \
  --nikto \
  --nuclei \
  --wpscan \
  --hydra \
  --save results.json
  
📝 Replace http://example.com with a domain/IP you legally control or are authorized to test.

📁 Output Directory
All results will be saved to:

pgsql
Copy
Edit
results/
├── results.json
├── results.html
└── results.pdf
🧠 You must create the results/ folder manually before running the scan.

🧪 Supported Tools
Tool	Purpose
Amass	Subdomain enumeration
WhatWeb	Web tech detection
Ping	Host reachability check
Traceroute	Network path mapping
Nmap	Port scanning
FFUF	Directory/path fuzzing
Nikto	Web vulnerability scanner
WPScan	WordPress vuln checks
Nuclei	Fast template-based vuln scanning
Hydra	Credential brute-forcing

📂 Wordlist Files
The following wordlists are included or expected:

common.txt – For FFUF directory fuzzing

users.txt – Usernames for Hydra

pass.txt – Passwords for Hydra

Place these files in the same directory as pentesting_toolkit.py.

📜 File Structure
File	Description
Dockerfile	Container setup
README.md	This documentation
pentesting_toolkit.py	Main Python CLI script
common.txt	Wordlist for FFUF fuzzing
users.txt	Username wordlist for Hydra
pass.txt	Password wordlist for Hydra

👨‍💻 Author
Kyle Martin
Cybersecurity Automation Specialist • Red Team Ops
🔱 Squid Tech Services

📜 License
MIT License — Free to use, modify, and share. Just stay ethical. 😉

🙋 Want to Contribute?
Fork the repo

Add more tool integrations

Improve output formatting

Add logging or alerting

PRs welcome anytime 🚀

🧠 Questions or Suggestions?
Open an issue or drop your ideas in Discussions



