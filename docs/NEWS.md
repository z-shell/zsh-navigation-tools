## News

- Changes from 2.2.1 to 2.2.7

- Tmux integration has been added – bind file znt-tmux.zsh in Tmux as
  described in README.md and e.g. run local history on remote hosts. Tmux
  opens new window with n-history, and pastes selected history entry into
  immediate previous window (e.g. a remote session). Fixed plugin.zsh file
  to not use (outer scope) positional parameters. This fixes problem with
  Grlm's Zsh configuration. The file now doesn't use "test" builtin (but
  [[ instead), because it can be shadowed by alias or command. Private
  history has been fixed to not overwrite its history file with the same
  content. This improves performance when switching to private history
  view.

- 06-10-2016

  - **Tmux-integration** – `Ctrl-B H` in Tmux to open `n-history` in new window.
    Then select history entry, it will be copied to the original Tmux window.
    Use this to execute local commands on remote hosts:

    ![tmux integration](http://imageshack.com/a/img922/4760/oyX7eN.gif)

    All that is needed is this line added to `~/.tmux.conf`:

    ```
    bind h run-shell -b "$ZNT_REPO_DIR/doc/znt-tmux.zsh"
    ```

    or – if Homebrew or other package manager is used:

    ```
    bind h run-shell -b "$ZNT_REPO_DIR/znt-tmux.zsh"
    ```

- 16-05-2016

  - `n-kill` has completion. It proposes **words** from what's in `ps -A`. Giving `n-kill`
    arguments means grepping – it will start only with matching `ps` entries.

- 15-05-2016

  - Fixed problem where zsh-syntax-highlighting could render `n-history` slow (for
    long history entries).

- 14-05-2016

  - Configuration can be set from `zshrc` (starting from `v2.1.12`). Documentation is [below](#configuration). Example:

    ```zsh
    znt_list_instant_select=1
    znt_list_border=0
    znt_list_bold=1
    znt_list_colorpair="green/black"
    znt_functions_keywords=( "zplg" "zgen" "match" )
    znt_cd_active_text="underline"
    znt_env_nlist_coloring_color=$'\x1b[00;33m'
    znt_cd_hotlist=( "~/.config/znt" "/usr/share/zsh/site-functions" "/usr/share/zsh"
                     "/usr/local/share/zsh/site-functions" "/usr/local/share/zsh"
                     "/usr/local/bin" )
    ```

- 10-05-2016

  - Search query rotation – use `Ctrl-A` to rotate entered words right.
    Words `1 2 3` become `3 1 2`.

- 09-05-2016

  - New feature: n-help tool, available also from n-history via `H` key. It
    displays help screen with various information on `ZNT`.

    ![n-help](http://imageshack.com/a/img922/7595/MvtJdI.gif)

- 08-05-2016

  - Approximate matching – pressing `f` or `Ctrl-F` will enter "`FIX`" mode,
    in which `1` or `2` errors are allowed in what's searched. This utilizes
    original Zsh approximate matching features and is intended to be used
    after entering search query, when a typo is discovered.

    ![fix mode](http://imageshack.com/a/img921/5756/64lFnv.gif)

- 06-05-2016

  - Private history can be edited. Use `e` key or `Ctrl-E` for that when in
    n-history. Your `$EDITOR` will start. This is a way to have handy set of
    bookmarks prepared in private history's file.
  - Border can be disabled. Use following snippet in `~/.config/znt/n-list.conf`
    or any other tool-targetted config file:

    ```zsh
    # Should draw the border?
    local border=0
    ```

- 30-04-2016

  - New feature: color themes. Use `Ctrl-T` and `Ctrl-G` to browse predefined
    themes. They are listed in [~/.config/znt/n-list.conf](https://github.com/psprint/zsh-navigation-tools/blob/master/.config/znt/n-list.conf).
    Use the file to permanently set a color scheme. Also, I sent a patch to Zsh developers
    and starting from Zsh > 5.2 (not yet released) supported will be 256 colors.
    The file [~/.config/znt/n-list.conf](https://github.com/psprint/zsh-navigation-tools/blob/master/.config/znt/n-list.conf)
    already has set of 256-color themes prepared :)

    ![themes](http://imageshack.com/a/img924/4310/EbRh30.gif)

- 29-04-2016

  - New feature: private history – n-history tracks selected history entries,
    exposes them via new view (activated with `F1`). It is shared across all
    sessions

- 28-04-2016
  - New features:
    1. New n-history view (activated with `F1`): Most Frequent History Words
    2. Predefined search keywords – use F2 to quickly search for chosen
       keywords (video: [https://youtu.be/DN9QqssAYB8](https://youtu.be/DN9QqssAYB8))
    3. Configuration option for doing instant selection in search mode
