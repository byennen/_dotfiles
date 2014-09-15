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

  desc "Install rubies"  
  task :rubies do
    info_install 'rubies'
    unless File.directory?('~/.rbenv/versions/2.0.0-p247')
      %x(rbenv rehash ; rbenv install 2.0.0-p247)
    end
  end

  desc "Install my custom overrides for OH MY ZS"
  task :custom do
    installer = ShellInstaller.new
    installer.link_files
  end
  
  task :homebrew do
    info_install 'homebrew'
    puts 'Install Linux HomeBrew'
    system 'ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"'
  end

  task :brews do
    system <<-EOF
      brew install imagemagick ack git npm \
      colordiff wget
    EOF
  end

  desc "Install/Update my Janus fork"
  task :vim do
    info_install 'Janus'
    if File.directory?('~/.vim')
      %x(cd ~/.vim ; rake)
    else
      %x(git clone git@github.com:byennen/janus.git ~/.vim ; cd ~/.vim ; rake)
    end
  end
  
  task :all => [:zsh, :rbenv, :rubies, :custom, :brews, :vim]
end
