require 'fileutils'
require 'erb'

require './tasks/util'

Dir['tasks/*.rake'].each{|f| load f }

TOPLEVEL = File.dirname(__FILE__)


# TODO: update this so its correct
namespace :new do
  desc "Change your shell to ZSH"
  task :zsh do
    system "chsh -s `which zsh` #{ENV['USER']}"
  end
end

if osx?
  desc "Everything a new OS X laptop needs"
  task :new => ['new:zsh', 'install:vim', 'install:rvm', 'install:brews']

  desc "Run the :new task and link dotfiles"
  task :default => [:new, 'link:all']
end
