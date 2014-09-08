require_relative "lib/rubyhelper/gem-version"

Gem::Specification.new do |s|
  s.name        = 'rubyhelper'
  s.version     = RubyHelper::VERSION
  s.date        = Time.now.getgm.to_s.split.first
  s.summary     = "hotfix (remove pry requirement)"
  s.description = "A list of utils for the basic Class of ruby."
  s.authors     = [
            	  "poulet_a"
		  ]
  s.email       = "poulet_a@epitech.eu",
  s.files       = [
               	  "lib/rubyhelper.rb",
               	  "lib/rubyhelper/gem-version.rb",
              	  "lib/rubyhelper/string.rb",
              	  "lib/rubyhelper/array.rb",
            	  "lib/rubyhelper/numeric.rb",
                  "lib/rubyhelper/time.rb",
                  "lib/rubyhelper/hash.rb",
                  "lib/rubyhelper/versionhelper.rb",
		  "README.md",
		  "Rakefile",
		  "rubyhelper.gemspec",
		  "test/test_array.rb",
		  "test/test_hash.rb",
		  "test/test_numeric.rb",
		  "test/test_string.rb",
		  "test/test_versionhelper.rb",
		  ]
  s.homepage    = "https://gitlab.com/Sopheny/rubyhelper"
  s.license     = "GNU/GPLv3"
  s.cert_chain  = ['certs/poulet_a.pem']
  s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
end
