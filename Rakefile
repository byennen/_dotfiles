require 'fileutils'

def info_install(pkg)
  puts "* Installing #{pkg}"
end

class ShellInstaller
  include FileUtils::Verbose

  def dotfiles
    Dir.glob("dotfiles/*")
  end

  def myfiles
    Dir.glob("myfiles/*")
  end

  def link_files
    info_install 'dotfiles'
    myfiles.each do |file|
      ln_sf File.expand_path(file), File.expand_path("~/.oh-my-zsh/custom/#{File.basename(file)}")
    end

    dotfiles.each do |dotfile|
      ln_sf File.expand_path(dotfile), File.expand_path("~/.#{File.basename(dotfile)}")
    end
  end

end

namespace :install do
  desc "Install OH MY ZSH"
  task :zsh do
    info_install 'OH-MY-ZSH'
    %x(curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh)
  end

  desc "Install rbenv"
  task :rbenv do
    info_install 'rbenv'
    if File.directory?('~/.rbenv')
      %x(cd ~/.rbenv ; git pull)
      %x(cd ~/.rbenv/plugins/ruby-build ; git pull )
    else
      %x(git clone git://github.com/sstephenson/rbenv.git ~/.rbenv)
      %x(cd ~/.rbenv ; mkdir -p ~/.rbenv/plugins ; cd ~/.rbenv/plugins ; git clone git://github.com/sstephenson/ruby-build.git)
    end
  end

  desc "Install my custom overrides for OH MY ZS"
  task :custom do
    installer = ShellInstaller.new
    installer.link_files
  end

  desc "Install rubies"
  task :rubies do
    info_install 'rubies'
    unless File.directory?('~/.rbenv/versions/2.3.1')
      %x(rbenv rehash ; rbenv install 2.3.1)
    end
  end

  desc "Install Homebrew"
  task :homebrew do
    info_install 'homebrew'
    puts 'You can ignore this message: "/usr/local/.git already exists!"'
    system 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

  end

  task :brews do
    system <<-EOF
      brew install imagemagick ack git \
      colordiff wget node mongo
    EOF
  end

  # desc "Setup/Update Atom"
  # task :atom do
  #   info_install 'Atom'
  #   if File.directory?('~/.atom')
  #     %x(rm -rf ~/.atom ; git clone git@github.com:byennen/atom-backup.git ~/.atom)
  #   else
  #     %x(git clone git@github.com:byennen/atom-backup.git ~/.atom)
  #   end
  # end

  # desc "Install Postgres"
  # task :postgres do
  #   info_install 'postgres'
  #   %x(brew install postgres)
  #   %x(initdb /usr/local/var/postgres)
  #   %x(ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents)
  #   %x(launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist)
  # end

  # desc "Install Meteor"
  # task :meteor do
  #   info_install 'meteor'
  #   %x(curl https://install.meteor.com/ | sh)
  # end

  # desc "Dropbox Symlinks"
  # task :dropbox do
  # info_install 'Dropbox Symlinks'
  #   %x(ln -sf ~/Dropbox/Code ~/Code)
  #   %x(sudo rm -rf ~/Documents ; ln -sf ~/Dropbox/Documents ~/Documents)
  # end

  task :all => [:zsh, :rbenv, :rubies, :homebrew, :custom, :brews]
  #:atom, :postgres, :meteor, :dropbox
end
