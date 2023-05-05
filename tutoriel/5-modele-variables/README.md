# Option avancée : gérer son propre modèle HTML

Utilisez la pleine puissance des variables et des modèles! Ce principe est à la base de tous les générateurs de site web –– statiques ou non.

[Modèle HTML de base utilisé par Pandoc](https://github.com/jgm/pandoc/blob/main/data/templates/default.html5)

Créez un fichier modèle : `_modele.html`.
(Le recours à la barre en bas n’est pas obligatoire; il s’agit d’une petite convention pour distinguer les fichiers HTML à publier des fichiers HTML modèles.)

```shell
touch _modele.html
```

<details>
<summary><h3>Exemple de contenu pour le modèle HTML</h3></summary>

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

## Un script pour éviter la répétition

Toute cette répétition est bien fastidieuse! Ne pourrait-on pas simplifier toutes ces commandes répétitives en une seule?

Créons un fichier shell `site.sh` :

```shell
touch site.sh
```

Une première manière simple serait de retranscrire nos commandes pour chaque page que nous souhaitons convertir. Commençons par cela, le gain de temps se fera déjà sentir!

<details>
<summary><h3>Contenu du fichier <code>site.sh</code></h3></summary>

```bash
#!/bin/bash

# `echo` est utilisé pour avoir un retour de l’activité qui se déroule dans la console
echo "Production du fichier accueil.html..."
pandoc --template _modele.html \
       --metadata-file variables.yml \
       --standalone \
       accueil.md \
       -o accueil.html

echo "Production du fichier page-1.html..."
pandoc --template _modele.html \
       --metadata-file variables.yml \
       --standalone \
       page-1.md \
       -o page-1.html

# ... et ainsi de suite
```

</details>

C’est un peu long. On pourrait réunir les options passées à Pandoc dans une variable, `OPTIONS_PANDOC` :

```bash
OPTIONS_PANDOC="--template _modele.html --metadata-file variables.yml --standalone"
```

… et l’utiliser ainsi dans votre script :

```bash
pandoc $OPTIONS_PANDOC [source] -o [sortie]
```

Sauvegardez votre script. Dans votre terminal, essayez de l’appeler :

```shell
bash site.sh
```

Vos fichiers devraient avoir être produits!

## Pour aller un peu plus loin…

Nous avons réussi à automatiser la fabrique de nos fichiers `accueil.html`, `page-1.html`, etc.; sauf que si nous renommons nos fichiers (par exemple : `accueil.md` => `index.md`) ou que nous en créons un nouveau (`page-4.html`), notre script ne sera plus à jour! Pouvons-nous faire quelque chose?

<details>
<summary><h3>Nouveau contenu du fichier <code>site.sh</code></h3></summary>

```shell
#!/bin/bash

# Aller chercher tous les fichiers source (markdown)
SOURCE=$(find . -iname "*.md" -not -iname "README*" -maxdepth 1)
# Énoncer les contreparties HTML
HTML=$(find . -iname "*.html" -not -iname "README*" -not -iname "_modele*" -maxdepth 1)
# options pour pandoc
OPTIONS_PANDOC="--to html --standalone --metadata-file=variables.yml --template _modele.html --toc --citeproc"

function clean() {
  echo ">*Nettoyage des fichiers HTML..."
  for i in $HTML; do
    echo "  rm $i"
    rm $i;
  done
  echo "" # produire une ligne vide dans la sortie de la console
}

function html() {
  cd $(pwd)

  echo "* Fabrication des fichiers HTML..."
  for i in $SOURCE; do
    echo "  Conversion de $i"
    pandoc $OPTIONS_PANDOC $i -o ${i/.md/.html};
  done;
  echo "" # produire une ligne vide dans la sortie de la console
}

function all() {
  clean
  html

  echo "Terminé!"
}

# et on lance la fonction `all` (qui fait tout)
all
```

</details>

---

Tutoriel terminé? Frottez-vous au petit [site](../..)!
