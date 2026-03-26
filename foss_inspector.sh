#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author  : Yatin Kumar | Reg: 24BCE11229
# Course  : Open Source Software | Slot: B22
# Description: Checks whether a given package is installed,
#              reports its version, and prints a one-line
#              philosophy note using a case statement.
#              Works on both Debian/Ubuntu (dpkg) and
#              Fedora/RHEL (rpm) systems.
# Usage   : ./foss_inspector.sh [package_name]
#           Defaults to 'firefox' if no argument is given.
# ============================================================

# --- Accept package name as first argument; default to firefox ---
PACKAGE="${1:-firefox}"

echo "=== FOSS Package Inspector ==="
echo "Checking package: $PACKAGE"
echo ""

# --- Detect which package manager is available and query accordingly ---
if command -v dpkg &>/dev/null; then
    # Debian / Ubuntu path: use dpkg -l and check for 'ii' (installed) status
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "$PACKAGE is INSTALLED."
        # Use awk to extract the version field (column 3) from dpkg output row 6
        dpkg -l "$PACKAGE" | awk 'NR==6 {print "Version  :", $3}'
    else
        echo "$PACKAGE is NOT installed."
        echo "Install with: sudo apt install $PACKAGE"
    fi

elif command -v rpm &>/dev/null; then
    # Fedora / RHEL path: use rpm -q to test presence
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "$PACKAGE is INSTALLED."
        # Print Version, License, and Summary fields from rpm -qi
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "$PACKAGE is NOT installed."
        echo "Install with: sudo dnf install $PACKAGE"
    fi

else
    # No known package manager found
    echo "Could not determine package manager on this system."
fi

echo ""

# --- Case statement: print a philosophy note based on the package name ---
# Each branch maps a known FOSS package to a short description of its significance
case "$PACKAGE" in
    firefox)
        echo "Philosophy: A non-profit browser fighting for an open, user-controlled web." ;;
    httpd|apache2)
        echo "Philosophy: The server that powered the open internet, built by community." ;;
    git)
        echo "Philosophy: Linus built it when proprietary version control failed him." ;;
    python3|python)
        echo "Philosophy: A language designed for humans, shaped entirely by community." ;;
    vlc)
        echo "Philosophy: Built by students in Paris who just wanted to stream video freely." ;;
    mysql|mysqld)
        echo "Philosophy: A database with a dual-licence story — community vs commercial." ;;
    libreoffice)
        echo "Philosophy: Born from a community fork — proof that users own their tools." ;;
    *)
        # Default case for any package not explicitly listed above
        echo "Philosophy: Open source software: built in the open, improved together." ;;
esac
