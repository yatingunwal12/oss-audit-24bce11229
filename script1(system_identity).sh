#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author  : Yatin Kumar | Reg: 24BCE11229
# Course  : Open Source Software | Slot: B22
# Chosen Software: Mozilla Firefox
# Description: Displays a system welcome screen showing
#              distro, kernel, user, uptime, date/time,
#              and the open-source licence of the OS.
# ============================================================

# --- Student and software variables ---
STUDENT_NAME="Yatin Kumar"
SOFTWARE_CHOICE="Mozilla Firefox"

# --- Gather system information via command substitution ---
KERNEL=$(uname -r)                                                        # Kernel release string
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')     # Human-readable distro name
USER_NAME=$(whoami)                                                        # Current logged-in user
HOME_DIR=$HOME                                                             # Home directory path
UPTIME=$(uptime -p)                                                        # Human-readable uptime
DATETIME=$(date '+%A %d %B %Y, %H:%M:%S')                                 # Formatted date and time

# --- Display the formatted identity report ---
echo "========================================"
echo "  Open Source Audit — $STUDENT_NAME"
echo "  Chosen Software : $SOFTWARE_CHOICE"
echo "========================================"
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home         : $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Date/Time    : $DATETIME"
echo "----------------------------------------"

# --- State the open-source licence that covers the OS ---
# Linux is distributed under the GNU General Public Licence version 2
echo "OS Licence   : GNU General Public Licence v2 (GPLv2)"
echo "========================================"
