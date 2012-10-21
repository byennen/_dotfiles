require 'fileutils'

def info_install(pkg)
  puts "* Installing #{pkg}"
end

class ShellInstaller
  include FileUtils::Verbose
  
  def dotfiles
    Dir.glob("dotfiles/*")
  end
  
  def link_files
    
    info_install 'dotfiles'
    dotfiles.each do |dotfile|
      ln_sf File.expand_path(dotfile), File.expand_path("~/.#{File.basename(dotfile)}")
    end

    info_install 'zshell'
    ln_sf File.expand_path("zsh"), File.expand_path("~/.zsh")
  end

end

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
      brew install imagemagick ack macvim git \
      colordiff colormake wget rbenv
    EOF
  end

  desc "Install/Update my Janus fork"
  task :vim do
    info_install 'Janus'
    if File.directory?('~/.vim')
      %x(cd ~/.vim ; rake)
    else
      %x(git clone git://github.com/carlhuda/janus.git ~/.vim ; cd ~/.vim ; rake)
    end
  end
  
  task :all => [:stuff, :brews, :vim]
end
