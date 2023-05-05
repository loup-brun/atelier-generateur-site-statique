#!/bin/bash

# Aller chercher tous les fichiers source (markdown)
SOURCE=$(find . -iname "*.md" -not -iname "README*" -maxdepth 1)
# Énoncer les contreparties HTML
HTML=$(find . -iname "*.html" -not -iname "README*" -note -iname "modele*" -maxdepth 1)
# options pour pandoc
OPTIONS_PANDOC="--to html --standalone --metadata-file=reglages.yml --template=modele/page.html --toc --citeproc"

#.PHONY = all tar clean
#all: $(HTML)
#
## Si l’un des fichiers modèle change, effectuer un `touch` sur le modèle
#modele/page.html: modele/barre-laterale.html modele/pied-de-page.html modele/ours.html
#	@echo "Modifications à prendre en compte pour $@..."
#	touch $@
#
## Recette pour transformer tous les fichiers markdown en HTML
#%.html: %.md reglages.yml modele/page.html
#	pandoc $(OPTIONS_PANDOC) $< -o $@
#
#tar: $(SOURCE)
#	tar --exclude=backup.tar.gz --exclude=.git/ --exclude=README* --exclude=.gitignore -czvf backup.tar ../
#
## Nettoyer les fichiers générés
#clean:
#	rm $(HTML)

function clean() {
  echo "* Nettoyage des fichiers HTML..."
  echo ""
  for i in $HTML; do
    echo "rm $i"
    rm $i;
  done
  echo ""
}

function html() {
  echo "* Fabrication des fichiers HTML..."
  echo ""
  for i in $SOURCE; do
    echo "Conversion de $i"
    pandoc $OPTIONS_PANDOC $i -o ${i/.md/.html};
  done;
  echo ""
}

function all() {
  clean
  html

  echo "Terminé!"
}

all
