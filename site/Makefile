# Aller chercher tous les fichiers source (markdown)
SOURCE=$(shell find . -iname "*.md" -not -iname "README*")
# Énoncer les contreparties HTML
HTML=$(SOURCE:.md=.html)
# options pour pandoc
OPTIONS_PANDOC=--to html --standalone --metadata-file=reglages.yml --template=modele/page.html --toc --citeproc

.PHONY = all tar clean
all: $(HTML)

# Si l’un des fichiers modèle change, effectuer un `touch` sur le modèle
modele/page.html: modele/barre-laterale.html modele/pied-de-page.html modele/ours.html
	@echo "Modifications à prendre en compte pour $@..."
	touch $@

# Recette pour transformer tous les fichiers markdown en HTML
%.html: %.md reglages.yml modele/page.html
	pandoc $(OPTIONS_PANDOC) $< -o $@

tar: $(SOURCE)
	tar --exclude=backup.tar.gz --exclude=.git/ --exclude=README* --exclude=.gitignore -czvf backup.tar ../

# Nettoyer les fichiers générés
clean:
	rm $(HTML)
