Linear Algebra II - LaTeX Notes

-----------
For questions or issues, please contact:
Nicolas Bartzsch
nbartzsch@ethz.ch

Last Updated: May 2025
ETH Zürich

==============================

This repository contains LaTeX source files for the Linear Algebra II lecture notes.

Directory Structure
-----------------
- build.sh         : Bash script for compiling the document
- main.tex         : Main document file 
- theory_sheet.tex : File to compile only one chapter
- chapters/        : Individual chapter files
- media/           : External images
- tikz/            : Compiled tikz figures
- script.sty       : Style sheet for the overall document
- gauss.sty        : Style sheet for notation when using the gauss algorithm

Requirements
-----------
- LaTeX distribution (e.g., TexLive)
- Required packages listed in script.sty
- GNU Plot 

Compilation (see note below for introducing new tikz figures to the document)
----------
To compile the document:
1. Make sure all required packages are installed
2. Run: build.sh 
3. Press enter to compile the whole document or type in a number corresponding to a chapter to compile only selected chapters

Note for new tikz figures
----------
- Always name your tikz figures before compiling them in the following way:
    \tikzsetnextfilename{<figure_name>}
        \begin{tikzpicture}
        ...
        \end{tikzpicture}
- Wrap all tikz figures in a \begin{figure} environment
- Wrap pfgplots in a tikz environment for faster compilation (and therefore also in a figure environment)
- When introducing a new tikz figure I recommend the following workflow:
    -- Comment out the chapter selection section in theory_sheet.tex (lines 27-29)
    -- Comment out all of the \include{<chapter_name>} of the other chapters that you are not working on
    -- Compile the document directly from the terminal with pdflatex -shell-escape theory_sheet.tex
    -- Once the external pdf of the tikz is compiled and saved in the tikz/ directory revert the changes made to theory_sheet.tex and normally compile with build.sh
- You can experiment with tikz figures in the tikztest.tex file