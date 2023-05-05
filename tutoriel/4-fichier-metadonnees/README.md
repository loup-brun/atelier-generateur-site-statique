# Création d’un modèle HTML et utilisation de variables

C’est un peu répetitif d’indiquer les mêmes variables dans plusieurs fichiers… par exemple, si nous souhaitons changer le pied de page de 2022 pour 2023, il faudrait le faire à la main dans chaque page! À moins que…

## Création d’un fichier de métadonnées unique

Nous allons référer nos variables communes dans un nouveau fichier de type [YAML](https://fr.wikipedia.org/wiki/YAML). (Vous pouvez utiliser l’extension `.yml` ou `.yaml`; assurez-vous simplement de conserver le même choix par la suite.)
N’ayez crainte, ce format correspond simplement à celui des métadonnées que vous inscriviez dans l’en-tête d’un fichier markdown.

Créez le fichier `variables.yml` :

```shell
touch variables.yml
```

Ouvrez ce fichier pour édition. Nous allons y reporter les variables répétées dans nos fichiers markdown.

```yaml
# ajout du menu dans le HTML
include-before:
  - |
    <nav class="menu">
      <a href="accueil.html">Accueil</a>
      <a href="page-1.html">Page #1</a>
      <a href="page-2.html">Page #2</a>
      <a href="page-3.html">Page #3</a>
    </nav>

# pied de page
include-after:
  - |
    <footer>
      <hr>
      &copy; 2023 – Tous droits réservés.
    </footer>

# feuille de style externe
css:
  - https://unpkg.com/almond.css@latest/dist/almond.lite.min.css
  - style.css
document-css: true # inclure les styles par défaut de pandoc

```

## Utiliser le fichier de métadonnées

Pour faire référence au fichier de métadonnées, il s’agit d’ajouter une option supplémentaire à la commande Pandoc, l’option `--metadata-file [fichier]` :

```shell
pandoc --metadata-file variables.yml --standalone accueil.md -o accueil.html

# et ainsi de suite pour chaque page...
```
