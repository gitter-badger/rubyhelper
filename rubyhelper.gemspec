require_relative "lib/gem-version"

Gem::Specification.new do |s|
  s.name        = 'rubyhelper'
  s.version     = RubyHelper::VERSION
  s.date        = Time.now.getgm.to_s.split.first
  s.summary     = "See Changelog"
  s.description = "Improvements and additions by poulet_a to the basic ruby classes"
  s.authors     = [
            	  "poulet_a"
		  ]
  s.email       = "poulet_a@epitech.eu",
  s.files       = [
               	  "lib/rubyhelper.rb",
               	  "lib/gem-version.rb",
              	  "lib/rubyhelper/string.rb",
              	  "lib/rubyhelper/string_numeric.rb",
              	  "lib/rubyhelper/array.rb",
            	  "lib/rubyhelper/numeric.rb",
            	  "lib/rubyhelper/fixnum.rb",
                  "lib/rubyhelper/time.rb",
                  "lib/rubyhelper/hash.rb",
                  # "lib/rubyhelper/argumenterror.rb",
		  "README.md",
		  "Rakefile",
		  "rubyhelper.gemspec",
		  "test/test_array.rb",
		  "test/test_hash.rb",
		  "test/test_numeric.rb",
		  "test/test_fixnum.rb",
		  "test/test_string.rb",
		  "test/test_string_numeric.rb",
		  ]
  s.homepage    = "https://gitlab.com/poulet_a/rubyhelper"
  s.license     = "GNU/GPLv3"
  s.cert_chain  = ['certs/poulet_a.pem']
  s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
end
