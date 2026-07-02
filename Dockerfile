FROM node:22-alpine

USER root

# Install Python, pip, sqlite3
RUN apk add --no-cache python3 py3-pip sqlite

# Install openpyxl for Python script
RUN pip3 install --break-system-packages openpyxl

# Install n8n globally
RUN npm install -g n8n@latest --omit=dev

# Copy project files into container
COPY database/ /data/database/
COPY python/ /data/python/
COPY ["Contoh_Working Report - Rakarizal Muhammad Zidan - Jun 2026.xlsx", "/data/python/template.xlsx"]

# Init DB
RUN python3 /data/database/init_db.py

# Create output dir
RUN mkdir -p /data/output

# Set environment
ENV GENERIC_TIMEZONE=Asia/Jakarta
ENV TZ=Asia/Jakarta

# Run as node user
WORKDIR /data
RUN chown -R node:node /data
USER node

# n8n default port
EXPOSE 5678

CMD ["sh", "-c", "N8N_PORT=${PORT:-5678} n8n start"]
