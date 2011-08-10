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
