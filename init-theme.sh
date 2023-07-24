#!/bin/zsh

set -e

WORKING_DIR=$(dirname "$0")
echo "Working dir is $WORKING_DIR"

cd $WORKING_DIR

EXTERNAL=$1

echo "Using $1 config folder"

rm -rf ~/.local/share/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
rsync -av --progress "$WORKING_DIR/external/$1/" . --exclude ".git*"

