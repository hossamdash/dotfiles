#!/usr/bin/zsh
setopt extendedglob
cp /usr/share/applications/in.lsp_plug.lsp_plugins_* ~/.local/share/applications/
echo 'Hidden=true' >> ~/.local/share/applications/in.lsp_plug.lsp_plugins_*
