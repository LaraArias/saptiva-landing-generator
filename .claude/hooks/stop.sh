#!/bin/bash
# Ralph Wiggum Stop Hook
# Blocks exit and re-feeds the prompt until task is complete

PROMPT_FILE=".claude/PROMPT.md"

if [ -f "$PROMPT_FILE" ]; then
  # Check if PROMPT.md contains "DONE" marker
  if grep -q "^## DONE$" "$PROMPT_FILE"; then
    echo "✓ Task complete. Exiting."
    exit 0
  else
    echo "↻ Continuing iteration..."
    exit 1  # Block exit, continue loop
  fi
else
  exit 0
fi
