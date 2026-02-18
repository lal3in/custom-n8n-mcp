#FROM n8nio/n8n:latest
FROM naskio/n8n-python:latest

# Switch to root user to install global npm packages
USER root

# Create venv normally, then fix ownership for node user
RUN python3 -m venv /tmp/python-venv && \
    chown -R node:node /tmp/python-venv && \
    chmod -R 755 /tmp/python-venv && \
    /tmp/python-venv/bin/pip install --no-cache-dir --upgrade pip && \
    /tmp/python-venv/bin/pip install --no-cache-dir requests numpy pandas

# Install the desired npm packages globally
RUN npm install -g firecrawl-mcp

# Revert to the node user for security purposes
USER node
