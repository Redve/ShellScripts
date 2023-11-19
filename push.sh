#!/bin/bash


status=$(git status) 

if [[ "$status" == *"not a git repository"* ]]; then
  echo "Not a git repository. Exiting..."
  exit 1
fi

if [[ "$status" == *"nothing to commit"* ]]; then 
  echo "Nothing to commit. Exiting..."
  exit 1
fi

echo "You are commiting and pushing to the current branch."
echo "Enter commit message:"
read -e commitmsg

git add .
echo "Files to be commited:"
git ls-files --others --modified --deleted --exclude-standard
git commit -m "$commitmsg"


echo "You sure you wanna push? (y/n)"
read -i "y" -e yn

if [ "$yn" = y ]; then
  git push origin
else
  echo "Have a nice day!"
fi
