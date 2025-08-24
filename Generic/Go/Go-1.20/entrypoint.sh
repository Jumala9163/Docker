#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# STARTUP内の変数（{{}}や$VAR）を展開して実行
# 例: go build -o bin/app . && ./bin/app
echo "Container OS: $(uname -a)"
echo "Go: $(/usr/local/go/bin/go version 2>/dev/null || true)"
echo "Working dir: $(pwd)"

MODIFIED_STARTUP=$(eval echo "$STARTUP")
echo ":/home/container$ ${MODIFIED_STARTUP}"

# 実行
exec env ${MODIFIED_STARTUP}
