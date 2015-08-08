# Zsh Visual Tools

Video: [http://youtu.be/lUiwGSMhA5o](http://youtu.be/lUiwGSMhA5o)

A tool generating a selectable curses-based list of elements that has access to current ZSH session, i.e. has broad capabilities to work together with it. That's v1list. The files v1cd, v1env, v1kill, etc. are applications of the tool.

This is an alternative approach to idea of visual shell, when compared to Midnight Commander. Here the command line is the main way the shell is used. From that mode of operation, user call tools that do not require mouse or typing, only navigating. Good example is zsh's AUTO_PUSHD feature. When user displays the directory stack to find the past directory that he would like to return into, he normally has to enter the directory path or invoke popd multiple times. With v1cd, only a few cursor key pushes are needed.

v1env does the same for environment. User is presented with a browsable list of environment variables and only navigation with cursor keys is needed to start editing a variable.

## Installation
Copy all v1* files to /usr/share/zsh/[-version-]/functions/ and then add:

**autoload v1list v1cd v1env v1kill v1panelize v1options v1aliases v1functions v1history**

to ~/.zshrc
