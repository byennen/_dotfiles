function zsh_recompile() {
  autoload -U zrecompile
  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}

function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}

#Obtiva
function deploy_obtiva {
	cd $HOME/Sites/qa.obtiva.com
	git pull
	heroku db:push --app obtiva-home-staging
	git push heroku-staging master
}

function deploy_obtiva_production {
	cd $HOME/Sites/qa.obtiva.com
	git pull
	heroku db:push --app obtiva-home
	git push heroku master
}