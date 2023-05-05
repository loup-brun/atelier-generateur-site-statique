# Un (petit) site personnel

Si vous avez réussi à parcourir toutes les étapes du tutoriel, bravo! Vous avez acquis un savoir exceptionnel qui vous permettra de mettre en place votre propre petit site web statique.

Cette section est désignée à être réalisée en atelier; le présent README sera donc moins didactique.

## Explication des fichiers

- `README.md` : ce fichier d’aide-mémoire.
- `index.md` : la première page de votre site.
- `reglages.yml` : les variables partagées par l’ensemble du site.
- `references.bib` : un fichier de références bibliographiques (utilisez le vôtre!).
- `Makefile` : fichier contenant la recette à exécuter avec `make`.
- `site.sh` : format alternatif de recette en bash si vous n’avez pas `make`.
- `css/` : répertoire des feuilles de style CSS (l’assaisonnement, la peinture et le vernis).
- `modele/` : répertoire des fichiers de modèle HTML (nos moules à gâteau, nos blocs Lego).

## Commandes

Pour commencer, se déplacer dans le répertoire `site` avec le terminal :

```shell
# à partir de la racine du projet
cd site
```

Utiliser `make` pour lancer des commandes (si `make` est installé) :

```shell
# fabriquer les fichiers HTML
make all

# nettoyer les fichiers HTML construits
make clean

# commande par défaut, qui fait clean + all
make
```

Si vous n’avez pas make, le petit script shell fera l’affaire :

```shell
./site.sh  # ou encore: `bash site.sh`
```
