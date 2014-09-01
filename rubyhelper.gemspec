require_relative "lib/rubyhelper/version"

Gem::Specification.new do |s|
  s.name        = 'rubyhelper'
  s.version     = RubyHelper::VERSION
  s.date        = Time.now.getgm.to_s.split.first
  s.summary     = "add versionhelper"
  s.description = "A list of utils for the basic Class of ruby."
  s.authors     = [
            	  "poulet_a"
		  ]
  s.email       = "poulet_a@epitech.eu",
  s.files       = [
               	  "lib/rubyhelper.rb",
              	  "lib/rubyhelper/integerhelper.rb",
            	  "lib/rubyhelper/numerichelper.rb",
              	  "lib/rubyhelper/stringhelper.rb",
              	  "lib/rubyhelper/arrayhelper.rb",
                  "lib/rubyhelper/timehelper.rb",
                  "lib/rubyhelper/hashhelper.rb",
                  "lib/rubyhelper/versionhelper.rb",
		  ]
  s.homepage    = "https://gitlab.com/Sopheny/rubyhelper"
  s.license     = "GNU/GPLv3"
end
