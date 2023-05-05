---
title: Accueil

# ajout du menu dans le HTML
include-before:
  - |
    <nav class="menu">
      <a href="accueil.html" class="courante">Accueil</a>
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
---

**Bienvenue sur la page d’accueil.**

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
