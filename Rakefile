require 'fileutils'

class ShellMadnessInstaller
  include FileUtils::Verbose

  def whoami
    `whoami`.strip
  end
  
  def dotfiles
    Dir.glob("dotfiles/*")
  end
  
  def link_files
    emacs_dir = File.expand_path("~/.emacs.d")
    unless File.exists?(emacs_dir)
      mkdir emacs_dir
    end

    ln_sf File.expand_path("./user.el"), File.expand_path("~/.emacs.d/#{whoami}.el")

    dotfiles.each do |dotfile|
      ln_sf File.expand_path(dotfile), File.expand_path("~/.#{File.basename(dotfile)}")
    end

    ln_sf File.expand_path("zsh"), File.expand_path("~/.zsh")
  end


end

desc "install to current user's home directory"
task :install do
  installer = ShellMadnessInstaller.new
  installer.link_files
end
