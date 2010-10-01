export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/bin:/usr/local/homebrew/bin:$PATH
export GEM_HOME=/usr/local/Cellar/gems/1.8

# Our list of directorys we can cd to from anywhere
export CDPATH=.:~/workspace:~/projects:~/src:~/Documents

# Setup terminal, and turn on colors
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1

# Enable color in grep
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='3;33'

# Enable color, and better prompt in LESS
export PAGER=less
export LESS="-erX"

export RUBYOPT=rubygems