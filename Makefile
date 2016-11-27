ALL: markdown pdf

markdown: technical-spec.tex
	pandoc -s technical-spec.tex -o README.md -t markdown_github

pdf: technical-spec.tex
	xelatex -synctex=1 -interaction=nonstopmode technical-spec.tex
	rm -f *.aux *.bcf *.log *.out *.run.xml *.synctex.gz

clean:
	rm -f *.aux *.bcf *.log *.out *.run.xml *.synctex.gz
	rm -f *.md *.pdf
