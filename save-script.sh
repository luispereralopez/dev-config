#!/bin/zsh

cd /Users/luisp/ist/projects/dev-config
git checkout master
git pull

timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "Starting script on $timestamp" >> log.txt

# copy required files and folders to this repo
cp ~/.zshrc /Users/luisp/ist/projects/dev-config/zsh-profile/.zshrc
echo "Successfully copied .zshrc file on $timestamp" >> log.txt

cp -R ~/ist/cmds /Users/luisp/ist/projects/dev-config/
echo "Successfully copied cmds folder on $timestamp" >> log.txt

# push to git
git add .
git commit -m "$timestamp"
git push
echo "Successfully pushed code to github on $timestamp" >> log.txt

cd -