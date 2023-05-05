# Option avancée ; gérer son propre modèle HTML

Utilisez la pleine puissance des variables et des modèles!

[Modèle HTML de base utilisé par Pandoc](https://github.com/jgm/pandoc/blob/main/data/templates/default.html5)

Créez un fichier modèle : `_modele.html`.
(Le recours à la barre en bas n’est pas obligatoire; il s’agit d’une petite convention pour distinguer les fichiers HTML à publier des fichiers HTML modèles.)

```shell
touch _modele.html
```

<details>
<summary>Exemple de contenu pour le modèle HTML</summary>

```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8" />

  <!-- Titre du document -->
  <title>$pagetitle$</title>

  <!-- Auteur -->
  <!-- Note: la variable `author-meta` est géré par pandoc, utilisez `author` dans vos fichiers d’écriture -->
  $for(author-meta)$
  <meta name="author" content="$author-meta$" />
  $endfor$

  <!-- Date -->
  <!-- Note: la variable `date-meta` est géré par pandoc, utilisez `date` dans vos fichiers d’écriture -->
  $if(date-meta)$
  <meta name="dcterms.date" content="$date-meta$" />
  $endif$

  <!-- Description -->
  $if(description-meta)$
  <!-- Note: la variable `description-meta` est géré par pandoc, utilisez `description` dans vos fichiers d’écriture -->
  <meta name="description" content="$description-meta$" />
  $endif$

  <!-- Styles, chemins spécifiés dans les métadonnées -->
  $for(css)$
  <link rel="stylesheet" href="$css$" />
  $endfor$

  <!-- Il est possible d’inclure d’autres éléments dans l’en-tête -->
  $for(header-includes)$
  $header-includes$
  $endfor$
</head>

<body>
<!-- Corps du document -->

$for(include-before)$
$include-before$
$endfor$

<!-- Ours (bannière, menu...) -->
<header class="ours"></header>

<!-- Disposition principale -->
<main>
  <!-- Barre latérale -->
  <div class="barre-laterale"></div>

  <!-- Contenu principal -->
  <article class="contenu-principal">
    $body$
  </article>
</main>

<!-- Pied-de-page -->
<footer class="pied-de-page"></footer>

$for(include-after)$
$include-after$
$endfor$
</body>
</html>
```

</details>

## Utiliser le modèle

Pour utiliser le fichier modèle avec Pandoc, utilisez l’option `--template [fichier]`.

```shell
# les barres obliques inversées servent uniquement à 
# poursuivre la commande à la ligne suivante
pandoc --template _modele.html \
       --metadata-file variables.yml \
       --standalone \
       accueil.md \
       -o accueil.html
       
# ... évidemment, répéter pour chaque fichier à transformer en HTML
```
