# 2. Ajout d’une feuille de style CSS

Pandoc permet de spécifier des feuilles de style CSS à appliquer à notre document.

Créons un fichier `style.css` et ajoutons-lui quelques styles de base.

```css
/* Couleur de fond  et couleur de police pour l’ensemble du document */
html {
  background-color: whitesmoke;
  color: midnightblue;
}

```

À présent, nous pouvons référencer `style.css` dans les métadonnées de notre page :

```yaml
---
css:
  - style.css
---
```

Relançons la commande Pandoc :

```shell
pandoc --standalone page.md -o page.html
```
