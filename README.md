# Créer son (petit) site personnel avec Pandoc

Une recette pour fabriquer une page web (ou deux…) bien à soi, grâce à Pandoc!

Taille idéale du site : entre 1 et 5 pages.

(Note : cette recette n’est pas adaptée pour les sites avec des sections.)

## Prérequis

Connaissances de base :

- Markdown ([séance debugue sur le balisage](https://debugue.ecrituresnumeriques.ca/seance-01-langages-de-balisage/))
- HTML ([séance débugue sur HTML](https://debugue.ecrituresnumeriques.ca/seance-01-langages-de-balisage/))
- CSS ([séance debugue sur CSS](https://debugue.ecrituresnumeriques.ca/seance-02-introduction-css/))

Boîte à outils :

- un terminal (interface en ligne de commande)
- un éditeur de texte
- [pandoc](https://pandoc.org/installing.html)

## Commandes

Pour commencer se déplacer dans le répertoire `site` :

```shell
cd site
```

Utiliser `make` pour lancer des commandes :

```shell
# commande par défaut
make 

# fabriquer le html
make html

# nettoyer les fichiers construits
make clean
```

## Licence

Ce travail est placé dans le domaine public universel selon les modalités décrites par la Creative Commons Zero (CC0). Vous pouvez réutiliser librement les ressources et les repartager selon vos propres conditions.
