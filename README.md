# My dotfiles

My configuration of ZSH TMUX and VIM

## Configuration

The dotfiles configuration uses an elegant idea from [StreakyCobra on Hacker News](https://news.ycombinator.com/item?id=11070797)
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

```bash
git init --bare $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Usage
`dotfiles` is a alias to the `git` command
```bash
dotfiles st
dotfiles add .vimrc
dotfiles ci -m "Update .vimrc"
dotfiles push
```
