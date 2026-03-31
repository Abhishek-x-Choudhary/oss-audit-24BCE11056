#!/bin/bash
# Script 4 - Log File Analyzer
# Author: Abhishek Choudhary | Reg No: 24BCE11056
# Course: Open Source Software
# Description: Reads a log file line by line, counts keyword matches,
# and prints the last 5 matching lines.
# Usage: ./script4_log_analyzer_updated.sh /path/to/logfile [keyword]

LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
ATTEMPT=1
MAX_ATTEMPTS=2

if [ -z "$LOGFILE" ]; then
    echo "Please provide a log file path."
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
    if [ -s "$LOGFILE" ]; then
        break
    else
        echo "Attempt $ATTEMPT: File is empty. Checking again..."
        ATTEMPT=$((ATTEMPT + 1))
        sleep 1
    fi
done

if [ ! -s "$LOGFILE" ]; then
    echo "The file '$LOGFILE' is still empty after retrying."
    exit 1
fi

echo "=============================================================="
echo "                   LOG FILE ANALYZER                          "
echo "=============================================================="
echo "Student Name   : Abhishek Choudhary"
echo "Registration No: 24BCE11056"
echo "Log File       : $LOGFILE"
echo "Keyword        : $KEYWORD"
echo "--------------------------------------------------------------"

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""
echo "Last 5 matching lines:"
echo "--------------------------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5

echo "=============================================================="
