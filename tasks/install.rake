desc "Alias for install:all"
task :install => ['install:all']

namespace :install do
  desc "Install my stuff to home directory"
  task :stuff do
    installer = ShellInstaller.new
    installer.link_files
  end
  
  task :homebrew do
    info_install 'homebrew'
    puts 'You can ignore this message: "/usr/local/.git already exists!"'
    system 'ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)"'
  end

  task :brews => [:homebrew] do
    system <<-EOF
      brew install mysql imagemagick ack macvim nginx git \
      colordiff colormake wget install fortune watch memcached
    EOF
  end
  
  task :mysql do
    puts 'Creating the LaunchAgents directory...'
    system '-p ~/Library/LaunchAgents'

    puts 'Configuring MySQL...'
    system 'unset TMPDIR'
    system 'mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp'

    puts 'Adding MySQL to LaunchAgents...'
    system 'cp /usr/local/Cellar/mysql/5.5.14/com.mysql.mysqld.plist ~/Library/LaunchAgents/'
    system 'launchctl load -w ~/Library/LaunchAgents/com.mysql.mysqld.plist'
  end

  task :rvm do
    info_install 'RVM'
    system '/bin/bash -c "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"'
  end

  desc "Install/Update my Janus fork"
  task :vim do
    info_install 'Janus'
    if File.directory?('~/.vim') 
      %x(cd ~/.vim ; rake)
    else
      %x(git clone git://github.com/byennen/janus.git ~/.vim ; cd ~/.vim ; rake)
    end
  end
  
  desc "Reminder message"
  task :reminder do
    puts '****************************BYENNEN-DOTFILES****************************'
    puts 'Install is almost complete. Please open a new terminal window.'
    puts 'Run each of these commands one by one to use rvm ruby 1.8.7 as default over system default (osx install)'
    puts 'rvm install 1.8.7'
    puts 'rvm system ; rvm gemset export system.gems ; rvm 1.8.7 ; rvm gemset import system'
    puts 'rvm --default 1.8.7'
  end

  task :all => [:stuff, :brews, :mysql, :rvm, :vim, :reminder]
end
