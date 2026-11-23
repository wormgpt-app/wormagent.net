#!/usr/bin/env bash
# WormAgent wrapper - يظهر WormAgent في كل مكان (فك ضغط كامل)
REAL="$HOME/.wormagent/bin/wormagent-real"
# Handle --help anywhere
if [[ "$*" == *"--help"* || "$*" == *"-h"* ]]; then
  if [ -f "$REAL" ]; then
    "$REAL" "$@" 2>&1 | sed 's/OpenCode/WormAgent/g; s/opencode/wormagent/g; s/OPENCODE/WORMAGENT/g'
    exit ${PIPESTATUS[0]}
  fi
fi
if [[ "$*" == *"--version"* || "$*" == *"-v"* ]]; then
  if [ -f "$REAL" ]; then
    "$REAL" "$@" 2>&1 | sed 's/opencode/wormagent/g; s/OpenCode/WormAgent/g'
    exit ${PIPESTATUS[0]}
  fi
fi
# For TUI (no args), show new logo first
if [ $# -eq 0 ]; then
  RED='\033[0;31m'; MUTED='\033[0;2m'; NC='\033[0m'
  echo -e "${RED}█   █ █▀▀█ █▀▀█ █▄ ▄█ █▀▀█ █▀▀█ █▀▀▀ █  █ ▀▀█▀▀${NC}"
  echo -e "${RED}█ █ █ █  █ █▀▀▄ █ ▀ █ █▀▀█ █ ▀▀ █▀▀  █▄ █   █${NC}"
  echo -e "${RED} ▀ ▀  ▀▀▀▀ ▀  ▀ ▀   ▀ ▀  ▀ ▀▀▀▀ ▀▀▀▀ ▀ ▀▀   ▀${NC}"
  echo -e "${MUTED}  terminal coding agent${NC}"
  echo ""
fi
exec "$REAL" "$@"
