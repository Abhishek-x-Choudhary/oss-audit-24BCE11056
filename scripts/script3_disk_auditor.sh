#!/bin/bash
# Script 3 - Disk and Permission Auditor
# Author: Abhishek Choudhary | Reg No: 24BCE11056
# Course: Open Source Software
# Description: Checks important directories, their permissions, owner/group, and size.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot")

echo "=============================================================="
echo "                DIRECTORY AUDIT REPORT                        "
echo "=============================================================="
echo "Student Name   : Abhishek Choudhary"
echo "Registration No: 24BCE11056"
echo "--------------------------------------------------------------"
printf "%-15s %-25s %-12s\n" "Directory" "Permissions Owner/Group" "Size"
echo "--------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        [ -z "$SIZE" ] && SIZE="Restricted"
        printf "%-15s %-25s %-12s\n" "$DIR" "$PERMS" "$SIZE"
    else
        printf "%-15s %-25s %-12s\n" "$DIR" "Not Found" "-"
    fi
done

echo ""
echo "--------------------------------------------------------------"
echo "Chosen Software Config/Module Check"
echo "--------------------------------------------------------------"

KVER=$(uname -r)
KMOD_DIR="/lib/modules/$KVER"

if [ -d "$KMOD_DIR" ]; then
    KPERMS=$(ls -ld "$KMOD_DIR" | awk '{print $1, $3, $4}')
    KSIZE=$(du -sh "$KMOD_DIR" 2>/dev/null | cut -f1)
    [ -z "$KSIZE" ] && KSIZE="Restricted"
    echo "Path        : $KMOD_DIR"
    echo "Permissions : $KPERMS"
    echo "Size        : $KSIZE"
else
    echo "Kernel module directory not found for kernel version $KVER"
fi

echo "=============================================================="
