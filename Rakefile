require 'fileutils'

class ShellInstaller
  include FileUtils::Verbose
  
  def dotfiles
    Dir.glob("dotfiles/*")
  end
  
  def link_files
    
    puts "doing dotfiles..."
    dotfiles.each do |dotfile|
      ln_sf File.expand_path(dotfile), File.expand_path("~/.#{File.basename(dotfile)}")
    end

    puts "doing zshell..."
    ln_sf File.expand_path("zsh"), File.expand_path("~/.zsh")
  end

end

namespace :install do
  desc "Install my stuff to home directory"
  task :stuff do
    installer = ShellInstaller.new
    installer.link_files
  end

  desc "Install/Update my Janus fork"
  task :vim do
    puts "doing vim..."
    if File.directory?('~/.vim') 
      %x(cd ~/.vim ; rake)
    else
      %x(git clone git://github.com/byennen/janus.git ~/.vim ; cd ~/.vim ; rake)
    end
  end

  task :all => [:stuff, :vim]
end

task :default => 'install:all'
