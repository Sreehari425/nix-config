#!/usr/bin/env bash
set -e

TMP_FILE=$(mktemp)
TARGET="/var/lib/dnscrypt-proxy/hagezi.txt"
LOG="/var/log/dnscrypt-proxy/blocklist-update.log"

URL="https://codeberg.org/hagezi/mirror2/raw/branch/main/dns-blocklists/wildcard/pro.plus-onlydomains.txt"

mkdir -p /var/lib/dnscrypt-proxy
mkdir -p /var/log/dnscrypt-proxy

if curl -L -f -s "$URL" -o "$TMP_FILE"; then
    SIZE=$(stat -c%s "$TMP_FILE")

    if [ "$SIZE" -gt 1000000 ]; then
        mv "$TMP_FILE" "$TARGET"
        chown root:root "$TARGET"
        chmod 644 "$TARGET"

        systemctl restart dnscrypt-proxy

        echo "Update successful: $(date)" | tee -a "$LOG"
    else
        echo "Error: Downloaded file is too small ($SIZE bytes)" | tee -a "$LOG"
        rm "$TMP_FILE"
        exit 1
    fi
else
    echo "Error: Download failed (No internet?)" | tee -a "$LOG"
    rm -f "$TMP_FILE"
    exit 1
fi
