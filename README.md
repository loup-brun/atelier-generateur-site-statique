# Créer son (petit) site personnel avec Pandoc

Une recette pour fabriquer une page web (ou deux…) bien à soi, grâce à Pandoc!

Taille idéale du site : entre 1 et 5 pages.

(Note : cette recette n’est pas adaptée pour les sites avec des sections.)

## Prérequis

Connaissances de base :

- Markdown ([séance débugue sur le balisage](https://debugue.ecrituresnumeriques.ca/seance-01-langages-de-balisage/))
- HTML ([séance débugue sur HTML](https://debugue.ecrituresnumeriques.ca/seance-01-langages-de-balisage/))
- CSS ([séance debugue sur CSS](https://debugue.ecrituresnumeriques.ca/seance-02-introduction-css/))

Boîte à outils :

- un terminal (interface en ligne de commande)
- un éditeur de texte
- [pandoc](https://pandoc.org/installing.html)
- [make](https://www.gnu.org/software/make/) (optionnel, voir [ce billet](https://programminghistorian.org/en/lessons/building-static-sites-with-jekyll-github-pages) pour l’installation des outils en ligne de commande)

## Tutoriel
Suivez d’abord l’exercice (dans le dossier [`tutoriel/`](tutoriel)), puis frottez-vous à un petit site personnel!

## Commandes

Pour commencer se déplacer dans le répertoire `site` :

```shell
cd site
```

Utiliser `make` pour lancer des commandes :

```shell
# fabriquer les fichiers HTML
make all

# nettoyer les fichiers HTML construits
make clean

# commande par défaut, qui fait clean + all
make
```

## Licence

Ce travail est placé dans le domaine public universel selon les modalités décrites par la Creative Commons Zero (CC0). Vous pouvez réutiliser librement les ressources et les repartager selon vos propres conditions.
