#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author  : Yatin Kumar | Reg: 24BCE11229
# Course  : Open Source Software | Slot: B22
# Description: Loops through a list of important system
#              directories and reports disk usage, owner,
#              and permissions for each one. Also checks
#              for the Firefox profile directory specifically.
# Usage   : ./disk_auditor.sh
# ============================================================

# --- Array of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "============================================="
echo "  System Directory Audit Report"
echo "============================================="

# Print a formatted header row using printf for aligned columns
printf "%-20s %-12s %-10s %s\n" "Directory" "Size" "Owner" "Permissions"
echo "---------------------------------------------"

# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory exists before attempting to read it
    if [ -d "$DIR" ]; then
        # Use ls -ld to get long listing of the directory itself (not its contents)
        # awk extracts field 1 (permissions) and field 3 (owner)
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')

        # du -sh gives human-readable size; redirect stderr to suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print the row; use ${SIZE:-N/A} to show N/A if size could not be read
        printf "%-20s %-12s %-10s %s\n" "$DIR" "${SIZE:-N/A}" "$OWNER" "$PERMS"
    else
        # Directory does not exist on this system
        printf "%-20s %-12s\n" "$DIR" "[does not exist]"
    fi

done

echo ""
echo "--- Firefox Profile Directory Check ---"

# --- Check specifically for Firefox's per-user config directory ---
# Firefox stores all user data in ~/.mozilla/firefox/
FF_DIR="$HOME/.mozilla/firefox"

if [ -d "$FF_DIR" ]; then
    echo "Firefox profile found at: $FF_DIR"

    # Read permissions, owner, and size of the profile directory
    PERMS=$(ls -ld "$FF_DIR" | awk '{print $1}')
    OWNER=$(ls -ld "$FF_DIR" | awk '{print $3}')
    SIZE=$(du -sh "$FF_DIR" 2>/dev/null | cut -f1)

    echo "Size: ${SIZE:-N/A} | Owner: $OWNER | Permissions: $PERMS"
else
    echo "No Firefox profile directory found at $FF_DIR"
    echo "(Firefox may not be installed or has never been launched by this user.)"
fi

echo "============================================="
