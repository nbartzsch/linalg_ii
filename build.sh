#!/bin/bash

# Ensure the script exits on errors
set -e

# List of available chapters
CHAPTERS=(
  "lineare_abb"
  "eigenwerte"
  "normen_skalarprod"
  "orthonormalbasis"
  "kern_bild"
  "basiswechsel_diag"
  "quadratische_formen"
  "hauptachsentrans"
  "kleinste_quadrate_qr"
)

# Function to display available chapters with numbers
display_chapters() {
  echo "Available chapters:"
  for i in "${!CHAPTERS[@]}"; do
    echo "  $((i + 1))) ${CHAPTERS[i]}"
  done
}

# Prompt the user for a chapter
echo "What chapter do you want to compile?"
display_chapters
echo "Enter the chapter number (or press Enter to compile the whole document):"
read -r CHOICE

# Check if the input is valid
if [[ -z "$CHOICE" ]]; then
  echo "Compiling the full document (main.tex)..."
  pdflatex -shell-escape main.tex
  open main.pdf
elif [[ "$CHOICE" =~ ^[0-9]+$ ]] && ((CHOICE >= 1 && CHOICE <= ${#CHAPTERS[@]})); then
  CHAPTER=${CHAPTERS[CHOICE-1]}
  echo "Compiling chapter: $CHAPTER"
  pdflatex -shell-escape "\\def\\selectedchapter{$CHAPTER}\\input{theory_sheet.tex}"
  open theory_sheet.pdf
else
  echo "Error: Invalid choice. Please select a valid chapter number."
  display_chapters
  exit 1
fi

# Notify the user of successful compilation
echo "Compilation completed successfully."
