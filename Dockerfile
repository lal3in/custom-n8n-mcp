#FROM n8nio/n8n:latest
FROM naskio/n8n-python:latest

# Switch to root user to install global npm packages
USER root

# Create Python virtual environment as node user (fix permissions)
RUN python3 -m venv /tmp/python-venv --owner node --group node && \
    chown -R node:node /tmp/python-venv && \
    /tmp/python-venv/bin/pip install --no-cache-dir --upgrade pip --user node && \
    /tmp/python-venv/bin/pip install --no-cache-dir requests numpy pandas --user node

# Install the desired npm packages globally
RUN npm install -g firecrawl-mcp

# Revert to the node user for security purposes
USER node
