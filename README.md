# My dotfiles

My configuration of ZSH TMUX and VIM

This repo has been created using this blog post: 
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/

The original idea is from StreakyCobra on Hacker News

```bash
git init --bare $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
