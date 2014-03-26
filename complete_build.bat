set file=ausarbeitung

tskill AcroRd32

pdflatex %file%
bibtex %file%
makeglossaries %file%
pdflatex %file%
pdflatex %file%

%file%.pdf
