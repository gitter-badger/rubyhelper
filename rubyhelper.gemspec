require_relative "lib/rubyhelper/version"

Gem::Specification.new do |s|
  s.name        = 'rubyhelper'
  s.version     = RubyHelper::VERSION
  s.date        = '2014-08-20'
  s.summary     = "add to_plain"
  s.description = "A list of utils for the basic Class of ruby."
  s.authors     = [
            	  "poulet_a"
		  ]
  s.email       = "poulet_a@epitech.eu",
  s.files       = [
               	  "lib/rubyhelper.rb",
              	  "lib/rubyhelper/integerhelper.rb",
              	  "lib/rubyhelper/stringhelper.rb",
              	  "lib/rubyhelper/arrayhelper.rb",
              	  "lib/rubyhelper/timehelper.rb",
		  ]
  s.homepage    = "https://gitlab.com/Sopheny/rubyhelper"
  s.license     = "GNU/GPLv3"
end
