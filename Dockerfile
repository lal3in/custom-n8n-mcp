FROM n8nio/n8n:latest

# Switch to root user to install global npm packages
USER root

# Install Python 3 + pip (Alpine-based image)
RUN apk add --no-cache python3 py3-pip

# Optional: Pre-install common packages (add more as needed)
RUN pip3 install --no-cache-dir requests numpy pandas

# Install the desired npm packages globally
RUN npm install -g firecrawl-mcp

# Revert to the node user for security purposes
USER node
