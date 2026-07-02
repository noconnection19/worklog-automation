FROM n8nio/n8n:latest

USER root

# ponytail: alpine-based n8n image, so apk not apt
RUN apk add --no-cache python3 py3-pip sqlite && \
    pip3 install --break-system-packages openpyxl

# Copy project files into container
COPY database/ /data/database/
COPY python/ /data/python/
COPY "Contoh_Working Report - Rakarizal Muhammad Zidan - Jun 2026.xlsx" /data/python/template.xlsx

# Init DB (will be overwritten by volume on Railway, but provides fallback)
RUN python3 /data/database/init_db.py

# Create output dir
RUN mkdir -p /data/output && chown -R node:node /data

USER node

# n8n default port
EXPOSE 5678
