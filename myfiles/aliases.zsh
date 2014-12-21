alias ls='ls -GFh'
alias ll='ls -GFhl'

alias g='git'
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gpa='git push-all' # see [alias] in ~/.gitconfig
alias gd='git diff | mate'
alias ga='git add'
alias gcl='git config --list'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gbc='git branch --color'
alias gba='git branch -a'
alias gco='git checkout'
alias gdc='git-svn dcommit'
alias gk='gitk --all &'
alias gdelete='git ls-files --deleted | xargs git rm'
alias ggraph='git log --pretty=format:"%h %s" --graph'
alias glog='git log --pretty=format:"%h - %an, %ar : %s"'
alias glog_jim='git log --pretty="%ar - %h - %s" --author=jimiray --no-merges'

alias gpatch='git diff master -p'
alias gitrm="git stat | grep deleted | awk '{print $3}' | xargs git rm"
alias gitx="open -b nl.frim.GitX"


alias ss='rails server'
alias ss2='rails server -p 3001 -e development tail-f log/development.log'
alias sc='rails console'
alias console="ruby rails console development"
alias destroy="rails destroy"
alias model='rails generate model'
alias controller='rails generate controller'
alias migration='rails generate migration'
alias migrate='rake db:migrate'
alias rollback='rake db:rollback'
alias redo="rake db:migrate && rake db:rollback"
alias rs='rake spec'
alias rt='rake test'
alias rf='rake features'

# tail log
alias log='tail -f -0 ./log/*.log'
alias taildev='tail -f log/development.log'
alias tailtest='tail -f log/test.log'

# directories
alias code='cd $HOME/Code/'
alias one='cd $HOME/Code/Meteor/one'
alias desktop='cd $HOME/Desktop/'
alias downloads='cd $HOME/Downloads/'

# general
alias home='cd ~'
alias l='ls -lah'
alias ls='ls -G'
alias h='history'
alias c='clear'
alias g='grep -i'
alias ..='cd ..'
alias ...='cd ../..'
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias a="atom ."
alias colorslist="set | egrep 'COLOR_\w*'"
alias show='cat ~/.dirs'

# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias hidefile='/usr/bin/SetFile -a "V"'
alias showfile='/usr/bin/SetFile -a "v"'
