#!/bin/bash

scss_main_file="ccfw.scss"
css_main_file="ccfw.css"
scss_path="./scss"
css_path="./css"

scss_main_path="$scss_path/$scss_main_file"
css_main_path="$css_path/$css_main_file"

function sass_cli() {
  scss --quiet --update $scss_main_path:$css_main_path
}

function xdate() {
  echo `date +%Y-%m-%d:%H:%M:%S`
}

echo "              #Welcome to Sass Watcher!#"
echo " - this app created for when ruby Sass watcher not working."
echo " - Official page: https://github.com/xtoolkit/sass_watcher"
IFS="$(printf '\n\t')"
i=0;
for file in `find $scss_path`; do
  date[$i]=$(stat -c %y "$file")
  let "i += 1"
done
while sleep 1; do
  let "i = 0"
  for file in `find $scss_path`; do
    date2=$(stat -c %y "$file")
    if [[ $date2 != ${date[$i]} ]]; then
      date[$i]=$(stat -c %y "$file")
      echo "[`xdate`] Starting Scss Compile"
      sass_cli
      echo "[`xdate`] $file changed"
      echo "[`xdate`] End Scss Compile"
    fi
    let "i += 1"
  done
done
