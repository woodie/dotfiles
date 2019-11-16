# vim: set tw=0:

export COLORTERM=yes
export EDITOR=nvim
export VISUAL=nvim
export FIGNORE='.o:~:.pyc'
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=100000
export MAILCAPS=${HOME}/.mailcap
export PS1='[\u@\h \[\033[0;36m\]\w\[\033[0m\]]\$ '
export RSYNC_RSH=/usr/bin/ssh
export USE_CCACHE=true
export GOPATH=${HOME}/go

export PATH=.:${PATH}
export PATH=~/prefix/bin:${PATH}
export PATH=$GOPATH/bin:${PATH}
export PATH=/usr/sbin:${PATH}
export PATH=~/.local/bin:${PATH}
export PATH=/usr/libexec/git-core:${PATH}

stty werase undef
bind '\C-W:unix-filename-rubout'
bind 'set completion-ignore-case on'

# Share bash history across terminal sessions
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

shopt -s checkwinsize

rreplace() {
  old=$1
  new=$2
  git grep -l $old . | xargs sed -i "s/$old/$new/g"
}

# command aliases
alias -- -='cd -'
alias -- ..='cd ..'
alias bc='bc -lq'
alias fc='forecash'
alias gdb='cgdb --directory=. -quiet'
alias json='python -m json.tool'
alias pdflatex='pdflatex -file-line-error -halt-on-error'
alias pmake='cores=$(grep -c "^processor" /proc/cpuinfo); make -j ${cores}'
alias reswap='sudo /sbin/swapoff -a; sudo /sbin/swapon -a'
alias vi='nvim'
alias vim='nvim -O'
alias watch='watch --color'

# miscellaneous aliases
alias r='tmux attach'
alias s='source ~/.bashrc'

if [[ $(uname) == "Darwin" ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  alias ls='ls -G'
else
  export JAVA_HOME=/etc/alternatives/java_sdk
  alias ls='ls --color'
fi

# git aliases
alias b='git branch'
alias ba='git branch -a'
alias d='git diff'
alias dc='git diff --cached'
alias ga='git add'
alias gb='git checkout @{-1}'
alias gap='git add -p'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gf='git fx'
alias gm='git commit -m'
alias griom='git rebase -i origin/master'
alias grom='git rebase origin/master'
alias gignore='git update-index --assume-unchanged'

gc() {
  git checkout -b fsareshwala/${1} -t origin/master
}

lg() {
  git log --abbrev-commit --oneline --pretty=format:'%C(red)%h%C(reset) %C(blue)<%<(25)%an>%Creset %s' -n 10 $@
}

st() {
  if [[ $(pwd) == */code/source* ]]; then
    git status --untracked-files=no
  else
    git status
  fi
}

git_bash_completion=/etc/profile.d/bash_completion.sh
test -f $git_bash_completion && source $git_bash_completion

ulimit -c unlimited
ulimit -m 1048576
# ulimit -n 8192
# ulimit -l 16384

# twitter setup
export PATH=~/code/git/.STAGE/git.Linux.x86_64/bin:${PATH}
export PATH=/opt/twitter_mde/bin:${PATH}
export PATH=/usr/share/rvm/src/rvm/bin:${PATH}
export PATH=/Users/fsareshwala/.gem/ruby/2.3.0/bin:${PATH}
export PATH=/home/fsareshwala/.gem/ruby/gems/easyviz-3.0.33/bin:${PATH}
export PATH=/home/fsareshwala/.rbenv/bin:${PATH}
export PANTS_NATIVE_BUILD_STEP_TOOLCHAIN_VARIANT=gnu

DOT_TOOLS=~/.tools
if [[ -f ${DOT_TOOLS} ]]; then
  for dir in $(cat ${DOT_TOOLS}); do
    export PATH=~/.tools-cache/${dir}/bin:${PATH}
  done
fi

# dottools: add distribution binary directories to PATH
if [ -r "$HOME/.tools-cache/setup-dottools-path.sh" ]; then
  . "$HOME/.tools-cache/setup-dottools-path.sh"
fi

alias rpost='arc multi-diff'
alias rsubmit='arc land'
alias rlist='arc list'
alias rassign='arc amend --revision'

tunnel() {
  ssh -N -L 8080:${1} n
}
