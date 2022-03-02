#!/bin/bash

cd /Users/luisp/ist/projects/dev-config
git checkout master
git pull

timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$timestamp] Starting script" >> log.txt

# copy required files/folders to this repo
cp ~/.zshrc /Users/luisp/ist/projects/dev-config/zsh-profile/.zshrc
echo "[$timestamp] Successfully copied .zshrc file" >> log.txt

cp ~/.p10k.zsh /Users/luisp/ist/projects/dev-config/zsh-profile/.p10k.zsh
echo "[$timestamp] Successfully copied .p10k.zsh file" >> log.txt

# push to git
git add .
git commit -m "$timestamp"
git push

cd -