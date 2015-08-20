# Zsh Navigation Tools

Video: [http://youtu.be/lUiwGSMhA5o](http://youtu.be/lUiwGSMhA5o)

A tool generating a selectable curses-based list of elements that has access to current ZSH session, i.e. has broad capabilities to work together with it. That's n-list. The files n-cd, n-env, n-kill, etc. are applications of the tool.

This is an alternative approach to idea of visual shell, when compared to Midnight Commander. Here the command line is the main way the shell is used. From that mode of operation, user call tools that do not require mouse or typing, only navigating. 

Think about IDEs, integrated development environments and the ability to navigate they provide. Typically, when user searches for occurences of a symbol throughout the project, what IDE does is that it provides a list that can be navigated. The navigation is done via mouse, but a good IDE should allow sticking to keyboard. But this doesn't mean that it should require typing. Even VIM ide-like plugins do navigation, not "incremental searches" through project. The recent trend for fuzzy finders is quite opposite to this, but IMO, this counts against them.

## Installation
Copy all n-* files to /usr/share/zsh/[-version-]/functions/ and then add:

**autoload n-list n-cd n-env n-kill n-panelize n-options n-aliases n-functions n-history n-preview**

to ~/.zshrc
