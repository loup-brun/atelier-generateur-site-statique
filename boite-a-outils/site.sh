#!/bin/bash

# Aller chercher tous les fichiers source (markdown)
SOURCE=$(find . -iname "*.md" -not -iname "README*" -maxdepth 1)
# Énoncer les contreparties HTML
HTML=$(find . -iname "*.html" -not -iname "README*" -note -iname "modele*" -maxdepth 1)
# options pour pandoc
OPTIONS_PANDOC="--to html --standalone --metadata-file=reglages.yml --template=modele/page.html --toc --citeproc"

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
