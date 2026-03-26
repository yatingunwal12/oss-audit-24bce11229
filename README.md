# oss-audit-24BCE11229

**Open Source Software — Capstone Project**  
VITyarthi | OSS NGMC Course | Units 1–5

---

| Field | Details |
|---|---|
| **Student Name** | Yatin Kumar |
| **Registration Number** | 24BCE11229 |
| **Slot** | B22 |
| **Date of Submission** | 27/03/2026 |
| **Chosen Software** | Mozilla Firefox |
| **Licence (Firefox)** | Mozilla Public Licence 2.0 (MPL 2.0) |

---

## About This Repository

This repository contains the five shell scripts submitted as part of the Open Source Audit capstone project. The accompanying written report (PDF) covers Firefox's origin story, licence analysis, ethical reflection, Linux footprint, FOSS ecosystem, and a comparative analysis against Google Chrome.

---

## Repository Structure

```
oss-audit-24BCE11229/
├── system_identity.sh       # Script 1 — System Identity Report
├── foss_inspector.sh        # Script 2 — FOSS Package Inspector
├── disk_auditor.sh          # Script 3 — Disk and Permission Auditor
├── log_analyser.sh          # Script 4 — Log File Analyser
├── manifesto_generator.sh   # Script 5 — Open Source Manifesto Generator
└── README.md
```

---

## Script Descriptions

### Script 1 — `system_identity.sh`
Displays a system welcome screen showing the Linux distribution name, kernel version, current logged-in user, home directory, system uptime, current date/time, and a message stating the open-source licence covering the OS (GPLv2).

**Shell concepts used:** variables, `echo`, command substitution `$()`, `grep`, `cut`, `tr`, `date`, `uptime`, basic output formatting.

---

### Script 2 — `foss_inspector.sh`
Checks whether a specified package (default: `firefox`) is installed on the system, retrieves its version number, and uses a `case` statement to print a one-line open-source philosophy note about the package. Compatible with both Debian/Ubuntu (`dpkg`) and Fedora/RHEL (`rpm`) systems.

**Shell concepts used:** positional arguments `$1`, default values `${1:-firefox}`, `if-then-else`, `case-esac`, `command -v`, `dpkg -l`, `rpm -qi`, `grep`, `awk`.

---

### Script 3 — `disk_auditor.sh`
Loops through a list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/lib`) and reports the disk usage, owner, and permissions of each. Also checks specifically for Firefox's per-user profile directory at `~/.mozilla/firefox`.

**Shell concepts used:** `for` loop over an array, `-d` directory test, `ls -ld`, `awk` for field extraction, `du -sh`, `cut`, `printf` for aligned tabular output.

---

### Script 4 — `log_analyser.sh`
Reads a log file line by line, counts how many lines contain a specified keyword (default: `error`), and prints a summary along with the last 5 matching lines. Accepts the log file path and keyword as command-line arguments.

**Shell concepts used:** `while IFS= read -r` loop, `if-then`, counter variables, arithmetic expansion `$((...))`, arrays, C-style `for` loop, `grep -iq`, positional arguments, file existence tests.

---

### Script 5 — `manifesto_generator.sh`
Asks the user three interactive questions, then composes a personalised open-source philosophy paragraph from their answers and saves it to a timestamped `.txt` file. The alias concept is demonstrated via a comment at the top of the script.

**Shell concepts used:** `read -p` for interactive input, string concatenation, grouped output redirection `{} > file`, `date` for timestamps, `cat` to display the saved file, alias (shown via comment).

---

## How to Run Each Script on Linux

### Prerequisites
- A Linux system (Ubuntu, Fedora, Debian, or any standard distribution)
- Bash shell (version 4.0 or later recommended)
- No additional software dependencies required for Scripts 1, 3, 4, and 5
- Script 2 requires either `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL) — both are pre-installed on their respective distributions

### Step 1 — Clone the repository

```bash
git clone https://github.com/YatinKumar/oss-audit-24BCE11229.git
cd oss-audit-24BCE11229
```

### Step 2 — Make all scripts executable

```bash
chmod +x system_identity.sh foss_inspector.sh disk_auditor.sh log_analyser.sh manifesto_generator.sh
```

### Step 3 — Run each script

#### Script 1 — System Identity Report
```bash
./system_identity.sh
```
No arguments required. Displays system info and licence message immediately.

---

#### Script 2 — FOSS Package Inspector
```bash
# Check Firefox (default)
./foss_inspector.sh

# Check a different package
./foss_inspector.sh git
./foss_inspector.sh vlc
./foss_inspector.sh python3
```
Accepts one optional argument: the package name. Defaults to `firefox` if omitted.

---

#### Script 3 — Disk and Permission Auditor
```bash
./disk_auditor.sh
```
No arguments required. Audits standard system directories and checks for Firefox's profile directory automatically.

---

#### Script 4 — Log File Analyser
```bash
# Search for 'error' (default keyword) in syslog
./log_analyser.sh /var/log/syslog

# Search for a custom keyword
./log_analyser.sh /var/log/syslog WARNING
./log_analyser.sh /var/log/auth.log failed

# On systems where /var/log/syslog doesn't exist, try:
./log_analyser.sh /var/log/messages error
```
Requires at least one argument (the log file path). The keyword defaults to `error` if not specified.

> **Note:** Reading `/var/log/syslog` may require `sudo` on some systems:
> ```bash
> sudo ./log_analyser.sh /var/log/syslog error
> ```

---

#### Script 5 — Open Source Manifesto Generator
```bash
./manifesto_generator.sh
```
No arguments required. The script will interactively prompt for three answers. The generated manifesto is saved as `manifesto_<username>_<timestamp>.txt` in the current directory.

**Optional — set up as an alias:**  
Add the following line to your `~/.bashrc` to run the script using the command `manifesto`:
```bash
echo "alias manifesto='bash ~/oss-audit-24BCE11229/manifesto_generator.sh'" >> ~/.bashrc
source ~/.bashrc
manifesto
```

---

## Dependencies

| Script | Dependencies |
|---|---|
| `system_identity.sh` | `bash`, `uname`, `grep`, `cut`, `tr`, `whoami`, `uptime`, `date` — all standard |
| `foss_inspector.sh` | `bash`, `dpkg` (Debian/Ubuntu) **or** `rpm` (Fedora/RHEL) |
| `disk_auditor.sh` | `bash`, `ls`, `du`, `awk`, `cut`, `printf` — all standard |
| `log_analyser.sh` | `bash`, `grep` — all standard |
| `manifesto_generator.sh` | `bash`, `date`, `whoami`, `cat` — all standard |

All dependencies are included in every standard Linux installation. No `apt install` or `pip install` is required.

---

## Reference Resources

- Mozilla Firefox source: https://hg.mozilla.org/mozilla-central/
- Mozilla Public Licence 2.0: https://www.mozilla.org/en-US/MPL/2.0/
- GNU Free Software Definition: https://www.gnu.org/philosophy/free-sw.html
- GNU Bash Manual: https://www.gnu.org/software/bash/manual/bash.html
- The Linux Command Line (Shotts): https://linuxcommand.org

---

*Submitted as part of the Open Source Software NGMC Capstone — VIT, 2026.*
