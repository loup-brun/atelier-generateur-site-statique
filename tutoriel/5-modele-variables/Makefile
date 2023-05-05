# Aller chercher tous les fichiers source (markdown)
SOURCE=$(shell find . -iname "*.md" -not -iname "README*")
# Énoncer les contreparties HTML
HTML=$(SOURCE:.md=.html)
# options pour pandoc
OPTIONS_PANDOC=--to html --template=_modele.html --metadata-file=variables.yml --standalone --toc --citeproc

# par défaut, si `make` est lancé sans commande
.PHONY = all clean

# la commande principale: produire tous les fichiers HTML
all: $(HTML)

# Recette pour transformer tous les fichiers markdown en HTML
%.html: %.md variables.yml _modele.html
	pandoc $(OPTIONS_PANDOC) $< -o $@

# Nettoyer les fichiers générés
clean:
	rm $(HTML)
