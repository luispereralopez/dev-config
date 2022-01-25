#!/bin/zsh

cd /Users/luisp/ist/projects/dev-config
git checkout master
git pull

timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$timestamp] Starting script" >> log.txt

# copy required files and folders to this repo
cp ~/.zshrc /Users/luisp/ist/projects/dev-config/zsh-profile/.zshrc
echo "[$timestamp] Successfully copied .zshrc file" >> log.txt

cp ~/.p10k.zsh /Users/luisp/ist/projects/dev-config/zsh-profile/.p10k.zsh
echo "[$timestamp] Successfully copied .p10k.zsh file" >> log.txt

cp -R ~/ist/cmds /Users/luisp/ist/projects/dev-config/
echo "[$timestamp] Successfully copied cmds folder" >> log.txt

# push to git
git add .
git commit -m "$timestamp"
git push

cd -