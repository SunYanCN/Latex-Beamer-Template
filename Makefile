out/slides.pdf: slides.tex
	# you need to run pdflatex command twice if you're having issues 
	# getting TOC or top progress bar to show up in resulting pdf
	mkdir -p out
	pdflatex --output-directory=out slides.tex

view-xpdf: out/slides.pdf
	xpdf out/slides.pdf & disown

view-okular: out/slides.pdf
	okular out/slides.pdf & disown

view-acroread: out/slides.pdf
	acroread out/slides.pdf & disown

clean:
	rm -rf out
