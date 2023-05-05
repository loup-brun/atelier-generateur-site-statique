#!/bin/bash

# Aller chercher tous les fichiers source (markdown)
SOURCE=$(find . -iname "*.md" -not -iname "README*" -maxdepth 1)
# Énoncer les contreparties HTML
HTML=$(find . -iname "*.html" -not -iname "README*" -not -iname "_modele*" -maxdepth 1)
# options pour pandoc
OPTIONS_PANDOC="--to html --standalone --metadata-file=variables.yml --template _modele.html --toc --citeproc"

function clean() {
  echo ">*Nettoyage des fichiers HTML..."
  for i in $HTML; do
    echo "  rm $i"
    rm $i;
  done
  echo "" # produire une ligne vide dans la sortie de la console
}

function html() {
  cd $(pwd)

  echo "* Fabrication des fichiers HTML..."
  for i in $SOURCE; do
    echo "  Conversion de $i"
    pandoc $OPTIONS_PANDOC $i -o ${i/.md/.html};
  done;
  echo "" # produire une ligne vide dans la sortie de la console
}

function all() {
  clean
  html

  echo "Terminé!"
}

# et on lance la fonction `all` (qui fait tout)
all
