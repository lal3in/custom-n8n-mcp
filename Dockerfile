#FROM n8nio/n8n:latest
FROM naskio/n8n-python:latest

# Switch to root user to install global npm packages
USER root

# Optional: Add more pip packages if needed
RUN pip3 install --no-cache-dir requests numpy pandas

# Install the desired npm packages globally
RUN npm install -g firecrawl-mcp

# Revert to the node user for security purposes
USER node
