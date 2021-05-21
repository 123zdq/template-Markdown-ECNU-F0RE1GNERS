pandoc --template algo --filter ./pandoc/minted.py --pdf-engine=xelatex --no-highlight --pdf-engine-opt="-shell-escape" -o template.tex --from markdown -V mainfont="YaHei" -V monofont="Consolas" -V sansfont="YaHei" -V CJKmainfont="YaHei" -V secnumdepth=2 -V --number-sections --toc -V include-before="\renewcommand\labelitemi{$\bullet$}" -V header-includes="\usepackage{minted}" -V geometry="margin=2cm" *-*.md -V fontsize=14pt
latexmk -xelatex -shell-escape template.tex
latexmk -c
