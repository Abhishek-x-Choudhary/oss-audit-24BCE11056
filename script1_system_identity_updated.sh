#!/bin/bash
# Script 1 - System Identity Report
# Author: Abhishek Choudhary | Reg No: 24BCE11056
# Course: Open Source Software
# Description: Displays key system identity information in a readable format.

STUDENT_NAME="Abhishek Choudhary"
REG_NO="24BCE11056"
SOFTWARE="Linux Kernel"

KERNEL=$(uname -r)
USERNAME=$(whoami)
HOME_DIR="$HOME"
UPTIME=$(uptime -p 2>/dev/null || uptime)
TODAY=$(date '+%d %B %Y, %H:%M:%S')

if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
elif command -v sw_vers >/dev/null 2>&1; then
    DISTRO="$(sw_vers -productName) $(sw_vers -productVersion)"
else
    DISTRO="Unknown System"
fi

LICENSE_MSG="GNU General Public License v2 (GPL v2)"

echo "=============================================="
echo "       OPEN SOURCE AUDIT - SYSTEM REPORT       "
echo "=============================================="
echo "Student Name   : $STUDENT_NAME"
echo "Registration No: $REG_NO"
echo "Software Chosen: $SOFTWARE"
echo "----------------------------------------------"
echo "Distribution   : $DISTRO"
echo "Kernel Version : $KERNEL"
echo "Logged In User : $USERNAME"
echo "Home Directory : $HOME_DIR"
echo "System Uptime  : $UPTIME"
echo "Date and Time  : $TODAY"
echo "----------------------------------------------"
echo "OS License     : $LICENSE_MSG"
echo "----------------------------------------------"
echo "The Linux kernel is free software. Users are"
echo "allowed to use, study, modify, and share it"
echo "under the terms of the GPL v2 license."
echo "=============================================="
