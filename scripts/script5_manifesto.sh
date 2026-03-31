#!/bin/bash
# Script 5 - Open Source Manifesto Generator
# Author: Abhishek Choudhary | Reg No: 24BCE11056
# Course: Open Source Software
# Description: Asks the user three questions and generates a personalized
# open-source manifesto saved to a text file.

echo "=============================================================="
echo "            OPEN SOURCE MANIFESTO GENERATOR                   "
echo "=============================================================="
echo "Student Name   : Abhishek Choudhary"
echo "Registration No: 24BCE11056"
echo "--------------------------------------------------------------"
echo "Answer the following three questions:"
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

TODAY=$(date '+%d %B %Y')
OUTFILE="manifesto_$(whoami).txt"

echo "==============================================================" > "$OUTFILE"
echo "                 MY OPEN SOURCE MANIFESTO                     " >> "$OUTFILE"
echo "==============================================================" >> "$OUTFILE"
echo "Name           : Abhishek Choudhary" >> "$OUTFILE"
echo "Registration No: 24BCE11056" >> "$OUTFILE"
echo "Date           : $TODAY" >> "$OUTFILE"
echo "--------------------------------------------------------------" >> "$OUTFILE"
echo "" >> "$OUTFILE"
echo "I use $TOOL every day, and that reminds me how powerful open" >> "$OUTFILE"
echo "source really is. For me, freedom means $FREEDOM, because I" >> "$OUTFILE"
echo "believe users should not just use software, but also have the" >> "$OUTFILE"
echo "right to study, improve, and share it. If I ever build $BUILD," >> "$OUTFILE"
echo "I would like to make it freely available so others can learn" >> "$OUTFILE"
echo "from it, improve it, and benefit from it just like I have" >> "$OUTFILE"
echo "benefited from open-source software." >> "$OUTFILE"
echo "" >> "$OUTFILE"
echo "-- Abhishek Choudhary" >> "$OUTFILE"
echo "==============================================================" >> "$OUTFILE"

echo ""
echo "Manifesto saved to: $OUTFILE"
echo ""

# Alias concept example:
# alias manifesto='bash script5_manifesto_updated.sh'
# This creates a shorter command name for running the script quickly.

cat "$OUTFILE"
