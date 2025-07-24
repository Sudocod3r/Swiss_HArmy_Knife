# ---------- Stage 1: Build Nuclei from source ----------
FROM golang:1.23-alpine AS nuclei-builder

RUN apk add --no-cache build-base git
WORKDIR /app
RUN git clone https://github.com/projectdiscovery/nuclei.git . && make build

# ---------- Stage 2: Build main pentest toolkit ----------
FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install system tools and base packages
RUN apt update && apt install -y \
    python3 python3-pip jq iputils-ping \
    git curl wget unzip ruby ruby-dev build-essential \
    perl libnet-ssleay-perl libwhisker2-perl \
    libwww-perl libhtml-parser-perl libxml-simple-perl \
    libjson-perl liblwp-protocol-https-perl libio-socket-ssl-perl openssl \
    nmap ffuf whatweb hydra traceroute \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip3 install requests python-nmap 

# Install Sublist3r
RUN git clone https://github.com/aboul3la/Sublist3r.git /opt/Sublist3r
ENV PYTHONPATH="/opt/Sublist3r:$PYTHONPATH"

# Install WPScan
RUN gem install wpscan

# Install Nuclei from the builder stage
COPY --from=nuclei-builder /app/bin/nuclei /usr/local/bin/nuclei
RUN chmod +x /usr/local/bin/nuclei

# Install Nikto manually
RUN git clone https://github.com/sullo/nikto.git /opt/nikto && \
    echo '#!/bin/sh\nexec perl /opt/nikto/nikto.pl "$@"' > /usr/local/bin/nikto && \
    chmod +x /usr/local/bin/nikto

# Set working directory
WORKDIR /app

# Copy toolkit and wordlists (Edit These to use other wordlists [Ex. rockyou.txt])
COPY pentesting_toolkit.py /app/pentesting_toolkit.py
COPY users.txt /app/
COPY pass.txt /app/

# Add wordlist for ffuf
RUN mkdir -p /usr/share/wordlists/dirb
COPY common.txt /usr/share/wordlists/dirb/common.txt

# Ensure results directory exists
RUN mkdir -p /app/results

# Run the script
ENTRYPOINT ["python3", "pentesting_toolkit.py"]
