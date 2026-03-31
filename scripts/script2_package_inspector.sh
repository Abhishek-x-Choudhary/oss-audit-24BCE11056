#!/bin/bash
# Script 2 - FOSS Package Inspector
# Author: Abhishek Choudhary | Reg No: 24BCE11056
# Course: Open Source Software
# Description: Checks whether a package is installed and prints details.

PACKAGE=${1:-"git"}

echo "=============================================="
echo "         FOSS PACKAGE INSPECTOR               "
echo "=============================================="
echo "Student Name   : Abhishek Choudhary"
echo "Registration No: 24BCE11056"
echo "Package Checked: $PACKAGE"
echo "----------------------------------------------"

if command -v dpkg >/dev/null 2>&1; then
    if dpkg -s "$PACKAGE" >/dev/null 2>&1; then
        echo "$PACKAGE is installed on this system."
        echo ""
        dpkg -s "$PACKAGE" | grep -E '^(Version|Maintainer|Description):'
    else
        echo "$PACKAGE is NOT installed on this system."
        echo "You can try: sudo apt install $PACKAGE"
    fi
elif command -v rpm >/dev/null 2>&1; then
    if rpm -q "$PACKAGE" >/dev/null 2>&1; then
        echo "$PACKAGE is installed on this system."
        echo ""
        rpm -qi "$PACKAGE" | grep -E '^(Version|License|Summary)'
    else
        echo "$PACKAGE is NOT installed on this system."
        echo "You can try: sudo dnf install $PACKAGE"
    fi
elif command -v brew >/dev/null 2>&1; then
    if brew list --formula | grep -qx "$PACKAGE" || brew list --cask | grep -qx "$PACKAGE"; then
        echo "$PACKAGE is installed through Homebrew."
        echo ""
        brew info "$PACKAGE" | head -n 8
    else
        echo "$PACKAGE is NOT installed through Homebrew."
        echo "You can try: brew install $PACKAGE"
    fi
else
    echo "No supported package manager found on this system."
fi

echo ""
echo "----------------------------------------------"
echo "Software Note:"
echo "----------------------------------------------"

case "$PACKAGE" in
    kernel|linux|linux-image*)
        echo "Linux Kernel: the open core of modern computing."
        ;;
    httpd|apache2|apache)
        echo "Apache HTTP Server: a foundational web server for the open internet."
        ;;
    mysql|mariadb)
        echo "MySQL/MariaDB: open-source databases used in millions of applications."
        ;;
    git)
        echo "Git: version control built by Linus Torvalds when proprietary tools failed him."
        ;;
    vlc)
        echo "VLC: a free multimedia player famous for openness and compatibility."
        ;;
    firefox)
        echo "Firefox: Mozilla's open-source browser built to protect the open web."
        ;;
    python|python3)
        echo "Python: a community-shaped language that made programming more accessible."
        ;;
    libreoffice)
        echo "LibreOffice: a community-driven office suite born from an open-source fork."
        ;;
    *)
        echo "$PACKAGE is part of the wider open-source ecosystem that powers modern software."
        ;;
esac

echo "=============================================="
