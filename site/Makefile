# Aller chercher tous les fichiers source (markdown)
SOURCE=$(shell find . -iname "*.md" -not -iname "README*")
# Énoncer les contreparties HTML
HTML=$(SOURCE:.md=.html)

.PHONY = all tar clean
all: $(HTML)

modele/page.html: modele/barre-laterale.html modele/pied-de-page.html modele/ours.html
	@echo "Vérification des modifications pour $@..."

# Recette pour transformer tous les fichiers markdwon en HTML
%.html: %.md reglages.yml modele/page.html
	pandoc \
		--to html \
		--standalone \
		--metadata-file=reglages.yml \
		--template=modele/page.html \
		$< -o $@

tar: $(SOURCE)
	tar --exclude=backup.tar.gz --exclude=.git/ --exclude=README* --exclude=.gitignore -czvf backup.tar ../

# Nettoyer les fichiers générés
clean:
	rm $(HTML)
