require 'rubygems'
require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb' 

begin
  Gem::Command.build_args = ARGV
rescue NoMethodError
end 

gem = Gem::DependencyInstaller.new
begin
  if RUBY_PLATFORM == "java"
    gem.install "msgpack-jruby"
  else
    gem.install "msgpack", [">= 0.4.4", "!= 0.5.0", "!= 0.5.1", "!= 0.5.2", "!= 0.5.3", "< 0.6.0"]
  end
rescue
  exit(1)
end

