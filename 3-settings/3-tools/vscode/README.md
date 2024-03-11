

## settings

Settings recommendation
* sticky scroll
* symlinks in search https://twitter.com/BHolmesDev/status/1749551516086685749
* misc https://dev.to/softwaredotcom/vs-code-settings-you-should-customize-5e75
*



backup:
* https://earthly.dev/blog/vscode-git/
  * https://github.com/adamgordonbell/vs-code-styles/tree/main

ln -s "$HOME/work/src/off/open-source-dev-env/3-settings/3-tools/vscode/linked/settings.json"    "$HOME/Library/Application Support/Code/User/settings.json"
ln -s "$HOME/work/src/off/open-source-dev-env/3-settings/3-tools/vscode/linked/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"



## Themes (optional)

Themes
- editor
- file icons
  - seem well maintained and support multi-root WS `Equinusocio.moxer-icons`



## Extensions
See https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management

```bash

code --install-extension  editorconfig.editorconfig

## https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight

## generic
## https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow
oderwat.indent-rainbow
## TODO tree
Gruntfuggly.todo-tree
## multi-root workspace compatible
joshx.workspace-terminals
## bookmarks? https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks
## window color based on hash of dir
https://marketplace.visualstudio.com/items?itemName=stuart.unique-window-colors
https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines
https://marketplace.visualstudio.com/items?itemName=SimonSiefke.svg-preview

## python
code --install-extension  ms-python.python
code --install-extension  ms-python.vscode-pylance
code --install-extension  ms-python.debugpy
## https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-environment-manager
code --install-extension  donjayamanne.python-environment-manager
## maybe? https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent


## C++
code --install-extension  ms-vscode.cpptools
code --install-extension  ms-vscode.cpptools-themes
## maybe https://marketplace.visualstudio.com/items?itemName=jeff-hykin.better-cpp-syntax


## Web
## prettier (microsoft)  https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
esbenp.prettier-vscode
## ESLint (microsoft)
dbaeumer.vscode-eslint
## npm intellisense
christian-kohler.npm-intellisense
## color highlight
naumovs.color-highlight
## official graphql
GraphQL.vscode-graphql-syntax
## accessibility
deque-systems.vscode-axe-linter
## CSS linting
stylelint.vscode-stylelint
## image preview? https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview
## HTML
https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag

## AI
GitHub.copilot
GitHub.copilot-chat
VisualStudioExptTeam.vscodeintellicode


## Misc
## CSV
mechatroner.rainbow-csv
https://marketplace.visualstudio.com/items?itemName=alexkrechik.cucumberautocomplete

```

### tosort
`code --list-extensions`

davidanson.vscode-markdownlint
dotjoshjohnson.xml
eamodio.gitlens
formulahendry.auto-rename-tag
graphql.vscode-graphql-syntax
meta.relay
mhcpnl.xcodestrings
ms-azuretools.vscode-docker
ms-vscode-remote.remote-containers
redhat.vscode-xml





TODO

https://code.visualstudio.com/docs/editor/multi-root-workspaces

https://www.geekytidbits.com/automatic-installation-of-recommended-vs-code-extensions/


EditorConfig.EditorConfig
