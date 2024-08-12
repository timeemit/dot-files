# Setup

To install these files in your home directory, DO NOT `git clone...`

First, make sure you have a ssh key with `ssh-keygen`.

Then,

```
git init
git checkout -b master
git remote add origin git@github.com:timeemit/dot-files.git
git fetch
git merge origin/master
```

If there are merge conflicts, prepend "old..." to the untracked files

To install the .vim and zsh-syntax-highlighting

```
git submodule init
git submodule update --recursive
```
