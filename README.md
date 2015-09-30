# Zsh Navigation Tools

Videos: [https://youtu.be/kznhIdLFrbk](https://youtu.be/kznhIdLFrbk) [https://youtu.be/JfQd7B0kKPM](https://youtu.be/JfQd7B0kKPM)

Screenshot (more at the [wiki](https://github.com/psprint/zsh-navigation-tools/wiki)):

![n-preview](http://imageshack.com/a/img540/4401/Xfb7nN.png)

A tool generating a selectable curses-based list of elements that has access to current ZSH session, i.e. has broad capabilities to work together with it. That's `n-list`. The files `n-cd`, `n-env`, `n-kill`, etc. are applications of the tool. Feature highlights include incremental searching, ANSI coloring, grepping and various integrations with ZSH.

This is an alternative approach to idea of visual shell, when compared to Midnight Commander. Here the command line is the main way the shell is used. From that mode of operation, user call tools that do not require mouse or typing, only navigating.

ZNT can be compared to IDEs, integrated development environments. Typically, when user searches for occurences of a symbol throughout the project, what IDE does is that it provides a list that can be navigated.

## Installation via plugin

Running script `doc/generate_plugin` will create single-file version of `ZNT`. It can be sourced from `.zshrc`
or added to `oh-my-zsh` (create directory `plugins/zshnavigationtools` and copy the plugin there). Don't forget
about configuration files as described below.

## Installation
Copy (or link) all n-\* files to **/usr/share/zsh/site-functions/** (or **/usr/local/share/zsh/site-functions/**, check with `echo $fpath[1]`) and then add:

    autoload n-list n-cd n-env n-kill n-panelize n-options n-aliases n-functions n-history n-preview

to ~/.zshrc.

To avoid typing of the minus sign "-" no-sign version can be simlinked (zsh code):

```zsh
cd /usr/share/zsh/site-functions/
IFS=$'\n'
for i in n-*; do sudo ln -s "$i" "n${i#n-}"; done
```

After making simlinks add one other autoload line:

    autoload nlist ncd nenv nkill npanelize noptions naliases nfunctions nhistory npreview

Don't forget to copy [configuration files](https://github.com/psprint/zsh-navigation-tools/tree/master/.config/znt). They should go to `~/.config/znt`. Moreover, `n-cd` works together with option `AUTO_PUSHD` and you should have:

```zsh
setopt AUTO_PUSHD
```

in `.zshrc` (also recommend `PUSHD_IGNORE_DUPS`). Without the option `n-cd` will just work as incremental searcher of directory bookmarks.

## Introduction

The tools are:

- `n-aliases` - browses aliases, relegates editing to `vared`
- `n-cd` - browses dirstack and bookmarked directories, allows to enter selected directory
- `n-env` - browses environment, relegates editing to `vared`
- `n-functions` - browses functions, relegates editing to `zed` or `vared`
- `n-history` - browses history, allows to edit and run commands from it
- `n-kill` - browses processes list, allows to send signal to selected process
- `n-options` - browses options, allows to toggle their state
- `n-panelize` - loads output of given command into the list for browsing
- `n-preview` - a demonstration of running two lists at the same time and of ANSI colors - syntax highlighted source browser

All tools support horizontal scroll with `<`,`>` or `{`,`}`. Other keys are:

- `[`,`]` - jump directory bookmarks in `n-cd` and typical signals in `n-kill`
- `Ctrl-d`, `Ctrl-u` - half page up or down
- `Ctrl-p`, `Ctrl-n` - previous and next (also done with vim's j,k)
- `Ctrl-l` - redraw of whole display
- `g, G` - beginning and end of the list
- `/` - start incremental search
- `Enter` - finish incremental search, retaining filter
- `Esc` - exit incremental search, clearing filter
- `Ctrl-w` (in incremental search) - delete whole word
- `Ctrl-k` (in incremental search) - delete whole line

## Programming

The function n-list is used as follows:

```zsh
n-list {element1} [element2] ... [elementN]
```

This is all that is needed to be done to have the features like ANSI coloring,
incremental search, horizontal scroll (grepping is done outside n-list, see the
tools for how it can be done). To set up non-selectable entries add their
indexes into array NLIST_NONSELECTABLE_ELEMENTS:

```zsh
typeset -a NLIST_NONSELECTABLE_ELEMENTS
NLIST_NONSELECTABLE_ELEMENTS=( 1 )
```

Result is stored as $reply[REPLY]. The returned array might be different from
input arguments as `n-list` can process them via incremental search. $REPLY is
the index in that possibly processed array. If $REPLY equals -1 it means that no
selection have been made (user quitted via 'q' key).
