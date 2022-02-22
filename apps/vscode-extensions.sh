#!/bin/bash

# Install VS Code extensions
extensions=(
  # Utilities
  DavidAnson.vscode-markdownlint
  VisualStudioExptTeam.vscodeintellicode
  aeschli.vscode-css-formatter
  darkriszty.markdown-table-prettify
  dbaeumer.vscode-eslint
  dsznajder.es7-react-js-snippets
  ecmel.vscode-html-css
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  formulahendry.code-runner
  goessner.mdmath
  ms-azuretools.vscode-docker
  oderwat.indent-rainbow
  redhat.vscode-yaml
  henriiik.vscode-sort
  VisualStudioExptTeam.vscodeintellicode
  lucas-rezende.greek-alphabet-snippets
  ms-azuretools.vscode-docker

  # Themes
  eliverlara.andromeda
  sdras.night-owl
  tinkertrain.theme-panda
)

for i in ${extensions[@]}; do
  code --install-extension $i
done
