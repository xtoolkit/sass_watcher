# Sass Watcher
this app created for when ruby Sass watcher not working.

## How to use

1- config `sass_watcher.sh` (scss_main_file, css_main_file, scss_path, css_path)

2- run app in bash:

```
  $ ./sass_watcher.sh
```

## How to work?

any file changed in `./scss_path` updated scss with bottom comment:

```
scss --quiet --update $scss_main_path:$css_main_path
```
