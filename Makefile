ALL: markdown pdf

markdown: technical-spec.tex
	pandoc -s technical-spec.tex -o README.md -t markdown_github

pdf: technical-spec.tex
	xelatex -synctex=1 -interaction=nonstopmode technical-spec.tex
	rm -f *.aux *.bcf *.log *.out *.run.xml *.synctex.gz

diagramspdf: 
	 (echo diagrams/creating-profile.svg --export-pdf=1.pdf; echo diagrams/request_ref.svg --export-pdf=2.pdf; echo diagrams/floating_ref.svg --export-pdf=3.pdf; echo diagrams/create_cv.svg --export-pdf=4.pdf) | inkscape --shell
	 pdfunite 1.pdf 2.pdf 3.pdf 4.pdf diagrams.pdf
	 rm 1.pdf 2.pdf 3.pdf 4.pdf


clean:
	rm -f *.aux *.bcf *.log *.out *.run.xml *.synctex.gz
	rm -f *.md *.pdf
