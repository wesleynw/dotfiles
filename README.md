# Dotfiles
Based on Atlassian's [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

## Installing on a new system
```bash
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
git clone --bare git@github.com:wesleynw/dotfiles.git $HOME/.dots
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
config checkout
```

if encountering overwrite errors, backup files beforehand:
```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
config checkout
```
