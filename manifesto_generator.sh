#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author  : Yatin Kumar | Reg: 24BCE11229
# Course  : Open Source Software | Slot: B22
# Description: Asks the user three interactive questions,
#              then composes a personalised open-source
#              philosophy statement and saves it to a
#              timestamped .txt file.
# Usage   : ./manifesto_generator.sh
#
# Alias tip (add to ~/.bashrc to use 'manifesto' as a command):
#   alias manifesto='bash ~/oss-audit-24BCE11229/manifesto_generator.sh'
# ============================================================

echo "========================================"
echo "  Open Source Manifesto Generator"
echo "========================================"
echo "Answer three questions to generate your personal"
echo "open-source philosophy statement."
echo ""

# --- Read interactive user input using read -p (prompt string) ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you in software? " FREEDOM
read -p "3. Name one thing you would build and share freely with the world: " BUILD

# --- Generate date strings using the date command ---
DATE=$(date '+%d %B %Y')                  # Human-readable date e.g. 27 March 2026
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')        # Compact timestamp for unique filename

# --- Construct output filename via string concatenation ---
# Uses $(whoami) for the current username and ${TIMESTAMP} for uniqueness
OUTPUT="manifesto_$(whoami)_${TIMESTAMP}.txt"

# --- Compose the manifesto paragraph and write it to the output file ---
# The {} block groups all echo commands; > redirects their combined output to $OUTPUT
{
    echo "Open Source Manifesto"
    echo "Generated : $DATE"
    echo "Author    : $(whoami)"
    echo "========================================"
    echo ""

    # Weave the user's three answers into a composed paragraph (string concatenation)
    echo "Every day, I rely on $TOOL — a piece of software built openly and shared freely"
    echo "by people who believed that knowledge belongs to everyone. To me, freedom in"
    echo "software means $FREEDOM. It means having the right to understand, to question,"
    echo "and to improve the tools I depend on, rather than simply accepting them as"
    echo "closed black boxes handed down by a corporation."
    echo ""
    echo "I commit to carrying that philosophy forward. When I build $BUILD, I will"
    echo "make it open. I will document it, licence it freely, and share it — not"
    echo "because I am required to, but because the tools I stand on today exist"
    echo "because someone before me made that same choice."
    echo ""
    echo "This is not idealism. It is how the internet was built."
    echo "========================================"

} > "$OUTPUT"    # Redirect entire grouped block output to the file

# --- Confirm save and display the result ---
echo ""
echo "Manifesto saved to: $OUTPUT"
echo ""

# Display the file contents using cat
cat "$OUTPUT"
