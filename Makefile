# Name of the generated pdf
PDF_NAME=ma_superbe_note.pdf
TEX_NAME=template_note
CLASS_NAME=note

# Paths of sections and images
IMG_PATH=images

# Figures generated with gnuplot
GP_PATH=gnuplot_script
GP_OUT=gnuplot_output
GP_SCRIPT=$(wildcard $(IMG_PATH)/$(GP_PATH)/*.gp)
GP_DATA=$(wildcard $(IMG_PATH)/$(GP_PATH)/*.dat)

# List of figures
IMG_LIST=$(wildcard $(IMG_PATH)/*)


all: pdf clean change_name


update_images: $(GP_SCRIPT) $(GP_DATA)
	@if [ -n "$(GP_SCRIPT)" ]; then          \
		mkdir -p $(IMG_PATH)/$(GP_OUT); \
		gnuplot $(GP_SCRIPT);           \
	fi


pdf: update_images $(TEX_NAME).tex $(CLASS_NAME).cls math_command.tex $(IMG_LIST)
	lualatex $(TEX_NAME).tex
	bibtex $(TEX_NAME)
	lualatex  $(TEX_NAME).tex
	lualatex $(TEX_NAME).tex


change_name:
	@mv $(TEX_NAME).pdf $(PDF_NAME)


clean:
	@find . -name '*~' -exec rm '{}' \;
	@find . -name '*.aux' -exec rm '{}' \; 
	@find . -name '*.bak' -exec rm '{}' \; 
	@find . -name '*.bbl' -exec rm '{}' \; 
	@find . -name '*.blg' -exec rm '{}' \; 
	@find . -name '*.gz' -exec rm '{}' \; 
	@find . -name '*.lof' -exec rm '{}' \; 
	@find . -name '*.log' -exec rm '{}' \; 
	@find . -name '*.lot' -exec rm '{}' \; 
	@find . -name '*.out' -exec rm '{}' \; 
	@find . -name '*.toc' -exec rm '{}' \; 




