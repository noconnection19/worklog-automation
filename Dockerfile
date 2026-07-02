FROM alpine:3.20 AS alpine

FROM n8nio/n8n:latest

USER root

# Restore apk package manager from Alpine (n8n image is Alpine-based but stripped)
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /etc/apk /etc/apk
COPY --from=alpine /lib/libapk* /lib/
COPY --from=alpine /usr/lib/libzstd* /usr/lib/

# Install Python + sqlite CLI
RUN apk add --no-cache python3 py3-pip sqlite \
    && pip3 install --break-system-packages openpyxl \
    && rm -f /sbin/apk  # cleanup: don't keep apk in prod image

# Copy project files
COPY database/ /data/database/
COPY python/ /data/python/
COPY ["Contoh_Working Report - Rakarizal Muhammad Zidan - Jun 2026.xlsx", "/data/python/template.xlsx"]

# Init DB + output dir
RUN python3 /data/database/init_db.py && mkdir -p /data/output

# Wrapper entrypoint: maps Railway PORT -> N8N_PORT
COPY start.sh /start.sh
RUN chmod +x /start.sh && chown -R node:node /data

USER node
WORKDIR /data

ENTRYPOINT ["/start.sh"]
