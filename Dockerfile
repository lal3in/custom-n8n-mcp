FROM n8nio/n8n:latest

# Switch to root user to install global npm packages
USER root

# Install Python 3 + pip (Debian/Ubuntu base image)
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Optional: Pre-install common packages
RUN pip3 install --no-cache-dir requests numpy pandas

# Install the desired npm packages globally
RUN npm install -g firecrawl-mcp

# Revert to the node user for security purposes
USER node
