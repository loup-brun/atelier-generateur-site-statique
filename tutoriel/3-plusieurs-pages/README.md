# Plusieurs pages HTML : vers un premier « site »

Pour notre projet, créons une série de pages :

```shell
touch accueil.md \
      page-1.md \
      page-2.md \
      page-3.md
```

N’oublions pas d’ajouter quelques métadonnées, comme le titre, le nom de l’auteur et la date.

```yaml
---
title: Titre de la page
date: 2023-05-24
---
```

On peut lancer la conversion Pandoc pour chacun de ces documents :

```shell
pandoc --standalone accueil.md -o accueil.html
pandoc --standalone page-1.md -o page-1.html
pandoc --standalone page-2.md -o page-2.html
pandoc --standalone page-3.md -o page-3.html
```

Un peu fastidieux… mais ça fonctionne!

## Ajout d’un menu

À présent que nous avons plusieurs pages, essayons d’ajouter un menu pour faciliter la navigation entre elles!

Dans l’en-tête du markdown, ajouter la propriété `include-before`, qui permet d’ajouter une liste de choses. Ajoutons un élément dans cette liste (désigné par le trait d’union `-`) en permettant la saisie sur plusieurs lignes, grâce au caractère `|` (<em lang="en">pipe</em>) :

```yaml
include-before:
  - |
    <nav class="menu">
      <a href="accueil.html" class="courante">Accueil</a>
      <a href="page-1.html">Page #1</a>
      <a href="page-2.html">Page #2</a>
      <a href="page-3.html">Page #3</a>
    </nav>

```

## Ajout d’un pied de page

Puisqu’il s’agit d’un site, nous pouvons ajouter du contenu HTML à la fin du document (propriété `include-after`) pour les crédits et les droits d’utilisation par exemple :

```yaml
include-after:
  - |
    <footer>
      <hr>
      &copy; 2023 – Tous droits réservés.
    </footer>

```

## Un petit plus pour le style…

Enfin, nous pouvons faire appel à une feuille de style externe, à tout hasard almond.css pour rendre notre document plus joli.

```yaml
css:
  - https://unpkg.com/almond.css@latest/dist/almond.lite.min.css
  - style.css
```

---

Prochaine étape : [Un modèle et des variables](../5-modele-variables)
