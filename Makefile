# Name of the generated pdf
PDF_NAME=ma_superbe_note.pdf
TEX_NAME=template_note
CLASS_NAME=note

# Paths of sections and images
IMG_PATH=images

all: pdf clean change_name

IMG_LIST=$(wildcard $(IMG_PATH)/*.jpg)

pdf: $(TEX_NAME).tex $(TEX_NAME).bib $(CLASS_NAME).cls $(IMG_LIST)
	pdflatex $(TEX_NAME).tex
	bibtex $(TEX_NAME)
	pdflatex $(TEX_NAME).tex
	pdflatex $(TEX_NAME).tex

change_name:
	@mv $(TEX_NAME).pdf $(PDF_NAME)

clean:
	@find . -name '*~' -exec rm '{}' \; 
	@find . -name '*.aux' -exec rm '{}' \; 
	@find . -name '*.bak' -exec rm '{}' \; 
	@find . -name '*.bbl' -exec rm '{}' \; 
	@find . -name '*.blg' -exec rm '{}' \; 
	@find . -name '*.lof' -exec rm '{}' \; 
	@find . -name '*.log' -exec rm '{}' \; 
	@find . -name '*.lot' -exec rm '{}' \; 
	@find . -name '*.out' -exec rm '{}' \; 
	@find . -name '*.toc' -exec rm '{}' \; 


