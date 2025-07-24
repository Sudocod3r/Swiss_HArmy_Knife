# Swiss_HArmy_Knife
The all-in-one, fully customizable, Web App Pentest Tool Kit for Kali Linux
# 🤖🔪 Swiss HArm-y Knife (SHAK)🗡️👨‍💻

A full-featured, containerized offensive security toolkit built for Kali Linux. SHAK automates recon, enumeration, and vulnerability scanning across web targets. Perfect for internal testing, bug bounty hunting, and red team workflows.

---

## 🔥 Features

### ✅ CLI-Driven, Containerized
Run a full suite of recon and vulnerability tools from a single command inside a secure Docker container.

### 🌐 Recon Tools
- `amass` – Subdomain enumeration  
- `whatweb` – Web tech fingerprinting  
- `ping`, `traceroute` – Basic network pathing  

### 🔓 Vulnerability Scanners
- `nuclei` – Template-based scanning  
- `nikto` – Web vuln scanner  
- `wpscan` – WordPress vulnerability checks  

### 🛠 Brute Force & Fuzzing
- `hydra` – Login brute-force attacks  
- `ffuf` – URL fuzzing for hidden paths  

### 📊 Reporting
- Auto-generated `.json`, `.html`, and `.pdf` reports  
- Organized output directory by scan type  

---

## ⚙️ Requirements

- Kali Linux (tested on 2023.3 and later)  
- Docker installed:  
  ```bash
  sudo apt install docker.io
Internet connection for tool functionality

⚠️ Note: Newer Kali versions or WSL may require manual package installs.

🚀 Quick Start
1. Clone the Repo
bash
Copy
Edit
git clone https://github.com/YOUR_USERNAME/shak.git
cd shak
2. Build the Docker Image
bash
Copy
Edit
sudo docker build -t shak .
3. Run SHAK on a Target
bash
Copy
Edit
sudo docker run --privileged --rm -v "$PWD:/app" -it shak \
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
You can rename or specify the output file using the --save flag.

🧪 Supported Tools
Tool	Purpose
Amass	Subdomain enumeration
WhatWeb	Web tech detection
Ping	Host reachability check
Traceroute	Network path mapping
Nmap	Port scanning
FFUF	Directory and path fuzzing
Nikto	Web vulnerability scanner
WPScan	WordPress vuln checks
Nuclei	Fast template-based vuln scanner
Hydra	Credential brute-forcing

🧪 Example Targets
🔫 IBM Firing Range

🐞 bWAPP

💣 DVWA

⚠️ This toolkit is for legal and ethical use only. Do not scan unauthorized targets.

📂 Custom Wordlists
To use your own username/password lists with Hydra:

Place users.txt and pass.txt in the root shak directory.

Modify shak.py to use your files if needed:

python
Copy
Edit
hydra -L users.txt -P pass.txt <target> http-get
Hydra will skip if those files are missing or malformed.

👨‍💻 Author
Kyle Martin
Cybersecurity Automation Specialist • Red Team Ops
🔱 Squid Tech Services

📜 License
MIT License — Free to use, modify, and share. Just stay ethical. 😉

🙋 Want to Contribute?
Fork the repo

Add new tool integrations

Improve scan output formatting

Add Slack/email alerting

PRs welcome anytime 🚀

🧠 Questions or Suggestions?
Open an issue or drop into Discussions!


