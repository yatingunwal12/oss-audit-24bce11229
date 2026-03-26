#!/bin/bash
# ============================================================
# Script 4: Log File Analyser
# Author  : Yatin Kumar | Reg: 24BCE11229
# Course  : Open Source Software | Slot: B22
# Description: Reads a log file line by line, counts how
#              many lines contain a given keyword, and
#              prints a summary along with the last 5
#              matching lines for context.
# Usage   : ./log_analyser.sh <logfile> [keyword]
# Example : ./log_analyser.sh /var/log/syslog error
#           ./log_analyser.sh /var/log/syslog WARNING
# ============================================================

# --- Accept command-line arguments ---
LOGFILE="${1}"             # First argument: path to log file
KEYWORD="${2:-error}"      # Second argument: search keyword; defaults to 'error'
COUNT=0                    # Counter variable: tracks number of matching lines
MATCH_LINES=()             # Array: stores every matching line for later display

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Validate that the specified file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

echo "=== Log File Analyser ==="
echo "File    : $LOGFILE"
echo "Keyword : $KEYWORD"
echo ""

# --- While-read loop: read the log file one line at a time ---
# IFS= prevents leading/trailing whitespace from being stripped
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # --- If-then: check if the current line contains the keyword ---
    # grep -iq: case-insensitive (-i) and quiet mode (-q, exit code only)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))       # Increment the counter using arithmetic expansion
        MATCH_LINES+=("$LINE")     # Append matching line to the array
    fi

done < "$LOGFILE"   # Feed the file into the while loop via stdin redirection

# --- Print the summary count ---
echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Print the last 5 matching lines if any were found ---
if [ ${#MATCH_LINES[@]} -gt 0 ]; then
    echo "--- Last 5 matching lines ---"

    # Calculate the starting index so we only show the final 5 entries
    TOTAL=${#MATCH_LINES[@]}
    START=$(( TOTAL > 5 ? TOTAL - 5 : 0 ))

    # C-style for loop to iterate from START to end of array
    for (( i=START; i<TOTAL; i++ )); do
        echo "  ${MATCH_LINES[$i]}"
    done
else
    echo "No lines matching '$KEYWORD' were found."
fi

echo ""
echo "=== Analysis complete ==="
