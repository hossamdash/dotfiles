#!/bin/sh
tag=$1

git tag -d $tag
git commit --all --amend --no-edit
git push --force
git tag $tag
git push --force --tags