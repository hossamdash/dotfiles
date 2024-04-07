#!/bin/bash

# sync installed pkgs
mkdir ./pkgs
brew list --cask >pkgs/brew_casks.txt
brew leaves >pkgs/brew_formulae.txt

# sync zsh files
cp ~/.zshenv ./
mkdir -p ./config/zsh
cp -r "$ZDOTDIR"/ ./config/zsh/
