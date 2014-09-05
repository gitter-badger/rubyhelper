# rubyhelper

Gem [![Gem Version](https://badge.fury.io/rb/rubyhelper.svg)](http://badge.fury.io/rb/rubyhelper)  
Dev [![GitHub version](https://badge.fury.io/gh/pouleta%2Frubyhelper.svg)](http://badge.fury.io/gh/pouleta%2Frubyhelper)  

You can see the documentation here : https://www.omniref.com/ruby/gems/rubyhelper

## Wtf ?
This gem is my own creation. It is a compilation of shortcuts, improvement,
helpers about the basic classes, String, Array, ... to make your work easier.  
I hope too help you with this gem.


## My favorites functions from this gem
- String.new.static(n) => String  
	Render a cool string with a static size. Few cool options tested and validated
- String.new.get_float => String  
	Usefull to extract a Numerical value from a stupid String
- Array.new.average /averagef  
	Simple and usefull integer/float average
- Array.new.sumf / sum  
	Simple and usefull float/integer sum


## Notes about the source code
The following sources code is not only my stuff, but also an implementation of idea found on stackoverflow, ...


# TODO
- Benchmark Hash.except with  
	```
		h.delete_if{|k| [:a].include? k}
	```  
- Improve documentation
- Prepare the v1.0
- Improve VersionHelper tests

# Contributors
- poulet_a : Creator and main developper. Feel free to ask me a question by email.  
	email   : arthur.poulet AT cryptolab.net  
	OpenPGP : 0x6D9EA34A  

