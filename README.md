# Zsh Navigation Tools

Video: [http://youtu.be/lUiwGSMhA5o](http://youtu.be/lUiwGSMhA5o)

A tool generating a selectable curses-based list of elements that has access to current ZSH session, i.e. has broad capabilities to work together with it. That's n-list. The files n-cd, n-env, n-kill, etc. are applications of the tool.

This is an alternative approach to idea of visual shell, when compared to Midnight Commander. Here the command line is the main way the shell is used. From that mode of operation, user call tools that do not require mouse or typing, only navigating. Good example is zsh's AUTO\_PUSHD feature. When user displays the directory stack to find the past directory that he would like to return into, he normally has to enter the directory path or invoke popd multiple times. With n-cd, only a few cursor key pushes are needed.

Other good example are IDEs, integrated development environments and the ability to navigate that they provide. Typically, when user searches for occurences of a symbol throughout the project, what IDE does is providing a list that can be navigated. The navigation is done via mouse, but a good IDE should allow sticking to keyboard. But this doesn't mean that it should require typing. Even VIM ide-like plugins do navigation, not "incremental searches" through project. The recent trend for fuzzy finders is quite opposite to this, but IMO, this counts against them.

What n-cd does for directory stack, n-env does for environment. User is presented with a browsable list of environment variables and only navigation with cursor keys is needed to start editing a variable.

## Installation
Copy all n-* files to /usr/share/zsh/[-version-]/functions/ and then add:

**autoload n-list n-cd n-env n-kill n-panelize n-options n-aliases n-functions n-history n-preview**

to ~/.zshrc
