alias ls='ls -GFh'
alias ll='ls -GFhl'
alias rdoc='rdoc --ri --line-numbers --all'
alias ri='ri -Tf ansi'
alias cycle_passenger='touch tmp/restart.txt'

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
# alias up='sake git:update' - need to priorities origin vs git-svn
function gpall() {
  git push rubyforge master --tags
  git push origin master --tags
}
alias gitrm="git stat | grep deleted | awk '{print $3}' | xargs git rm"
alias gitx="open -b nl.frim.GitX"

export SVN_USER="lanceennen"
alias sup='svn up'
alias sst='svn st'
alias sstu='svn st -u' # remote repository changes
alias scom='svn commit' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add' # adds all unadded files

alias svns='svn status'
alias svnci='svn ci'
alias svna='svn add'
alias svnr='svn remove'
alias svn_branch_start='svn log --verbose --stop-on-copy .'

alias svnaddall='svn st | grep "?" | sed -e "s/? *//" | xargs svn add'

#servers
alias server='ssh -p 30000 byennen@67.23.27.131'
alias hifive='ssh ec2-user@184.72.247.248 -i $HOME/sites/hifivesports/hifivesports.pem'
alias altimarc_staging='ssh ubuntu@ec2-107-21-119-78.compute-1.amazonaws.com -i $HOME/Sites/channels/altimarc-ec2.pem'
alias altimarc_production='ssh ubuntu@ec2-107-22-185-71.compute-1.amazonaws.com -i $HOME/Sites/channels/altimarc-ec2.pem'


# sites
alias apex='cd $HOME/Sites/Apex'

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

# misc
alias reload='. ~/.bash_profile'

# directories
alias code='cd $HOME/Documents/code/'
alias sites='cd $HOME/sites/'
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
alias m="mate ."
alias colorslist="set | egrep 'COLOR_\w*'"
alias show='cat ~/.dirs'

# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
alias hidefile='/usr/bin/SetFile -a "V"'
alias showfile='/usr/bin/SetFile -a "v"'
