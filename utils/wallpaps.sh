#!/bin/bash

WALLPAPER_DIR="$HOME/dotfiles/dotfiles/utils.wallpapers"
WALLPAPER="$WALLPAPER_DIR/reddit_wallpaper.jpg"

mkdir -p "$WALLPAPER_DIR"

# Парсим первую картинку с r/wallpapers
URL=$(curl -s https://www.reddit.com/r/wallpapers/top/.json?sort=top&t=week&limit=50 | jq -r '.data.children[] | select(.data.url|. != null and contains("http")) | .data.url' | grep -iE '\.(jpe?g|png)$' | shuf | head -n1)

# Скачиваем и ставим 
curl -s -o "$WALLPAPER" "$URL"
feh --bg-scale "$WALLPAPER"
