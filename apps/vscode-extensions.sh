#!/bin/bash

# Install VS Code extensions
extensions=(
  CoenraadS.bracket-pair-colorizer
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  dsznajder.es7-react-js-snippets
  ecmel.vscode-html-css
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  ms-azuretools.vscode-docker
  oderwat.indent-rainbow
  redhat.vscode-yaml
  VisualStudioExptTeam.vscodeintellicode
  aeschli.vscode-css-formatter
  # bmewburn.vscode-intelephense-client
  # darkriszty.markdown-table-prettify
  # esbenp.prettier-vscode
  # formulahendry.auto-close-tag
  # formulahendry.auto-rename-tag
  # formulahendry.code-runner
  # goessner.mdmath
  # henriiik.vscode-sort
  # ing-bank.vscode-psl
  # jchannon.csharpextensions
  # lucas-rezende.greek-alphabet-snippets
  # mgmcdermott.vscode-language-babel
  # ms-azuretools.vscode-docker
  # ms-dotnettools.csharp
  # ms-vscode.vscode-typescript-next
  # naco-siren.gradle-language
  # Pivotal.vscode-spring-boot
  # redhat.java
  # Tobiah.unity-tools
  # Unity.unity-debug
  # VisualStudioExptTeam.vscodeintellicode
  # vscjava.vscode-java-debug
  # vscjava.vscode-java-dependency
  # vscjava.vscode-java-pack
  # vscjava.vscode-java-test
  # xabikos.JavaScriptSnippets
  # xdebug.php-debug
  # xdebug.php-pack
  # zobo.php-intellisense
)

for i in ${extensions[@]}; do
  code --install-extension $i
done
