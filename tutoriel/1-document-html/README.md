# Création d’une page web

Une page web, c’est un fichier HTML. 

<details>
<summary>Qu’est-ce que le HTML?</summary>

On se rappelle, le HTML est une ensemble de paires de balises ouvrantes/fermantes  (par ex. `<p></p>`). C’est le langage de documents inventé par Tim Berners-Lee pour le World Wide Web – ce système hypertexte permettant aux chercheurs du monde entier de partager leurs connaissances.

```html
<body>
  <h1>Mon titre</h1>

  <nav class="table-des-matieres">
    <a href="#section-1">Section 1</a>
    <a href="#section-2">Section 2</a>
    <a href="#section-3">Section 3</a>
  </nav>

  <p>Contenu de mon document.</p>
</body>
```

[Séance débugue sur le balisage et HTML](https://debugue.ecrituresnumeriques.ca/seance-01-langages-de-balisage/)

</details>

~~Créons un nouveau fichier `page.html`~~ éditer un fichier HTML à la main, c’est un peu verbeux… n’y aurait-il pas un autre format de balisage léger qui nous permettrait d’arriver au même résultat?

## Markdown

Créons plutôt un fichier markdown, avec l’extension `.md` :

```shell
# dans le terminal, créer un fichier vide
touch page.md
```

Ajoutons un peu de contenu à ce fichier. Ouvrez `page.md` pour édition.

```markdown
# Titre de mon document

Un premier paragraphe.

1. une
#. liste
#. numérotée
#. automatiquement

```

## Conversion avec Pandoc

Essayons une première conversion avec les options par défaut. Pandoc reconnaîtra les formats avec les extensions de fichier (`.md` pour le markdown, `.html` pour HTML).

```shell
pandoc page.md -o page.html
```

En examinant le contenu de page.html, ne manque-t-il pas quelques balises?

Où sont passées les balises obligatoires `<html>`, `<body>`, etc.?

On peut y remédier en spécifiant à Pandoc l’option `--standalone` (ou `-s` pour faire court).

```shell
pandoc --standalone page.md -o page.html
```

Et voilà, un fichier HTML valide!

## Métadonnées

Nous pouvons aller un peu plus loin en spécifiant quelques métadonnées à même le fichier :

```yaml
---
title: Titre de mon document
author: Louis-Olivier Brassard
date: 2023-05-24
---
```

Relançons la commande et voyons le résultat!

---

Prochaine étape : [Ajouter une feuille de style](../2-style-css)
