# Plusieurs pages HTML : vers un premier « site »

Pour notre projet, créons une série de pages HTML :

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


## Un petit plus pour le style…
