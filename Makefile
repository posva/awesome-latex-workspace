all: report-clean report.pdf

%.pdf: %.tex
	pdflatex -shell-escape $<

%-clean:
	rm -f $*.pdf

clean:
	rm -f *.out *.pdf *.log *.toc *.aux

diff:
	./git-latexdiff.sh --quiet $$(cat last-commit.sha) -- -o report-diff.pdf
	git rev-parse HEAD > ./last-commit.sha
