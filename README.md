# rubyhelper

Gem [![Gem Version](https://badge.fury.io/rb/rubyhelper.svg)](http://badge.fury.io/rb/rubyhelper)  
Dev [![GitHub version](https://badge.fury.io/gh/pouleta%2Frubyhelper.svg)](http://badge.fury.io/gh/pouleta%2Frubyhelper)  

You can see the documentation here : http://rubydoc.info/gems/rubyhelper/

## How is it works ?
See the [wtf] section too know what is exactly this stuff.  
Too use the gem, install it :
```
$ gem install rubyhelper # install the last stable version
```

To use it in your ruby project, use
```
require 'rubyhelper'
```

## Wtf ?
This gem is my own creation. It is a compilation of shortcuts, improvement,
helpers about the basic classes, String, Array, ... to make your work easier.  
I hope too help you with this gem. I put also few lines from stackoverflow etc.
in this gem ;)


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
The following sources code is not only my stuff, but also an implementation of
idea found on stackoverflow, ...  

The developpement running like that :  
1. Found idea  
2. Put it in the gem  
3. Developpe few tests  
4. Push it in a unstable gem (like v1.0.alpha1)  
5. **repeat 1-4 actions few times**  
6. Improve tests  
7. Validate the version  
8. Push the version into master branch and tag it  
9. Push new "stable" version (like v1.1)  

Note about the first time developpement :  
I didn't predict to keep this gem in dev so the first part of the dev
is a little messy. Don't look back 1.1 ;)


# TODO
## Benchmark
- Hash.except with  
	```
		h.delete_if{|k| [:a].include? k}
	```  

## Improve VersionHelper
- Add test
- Add more documentation

## Improve main tests
- Add few tests for untested features
- Improve existing tests (mainly on StringHelper)

# Contributors
- poulet_a : Creator and main developper. Feel free to ask me a question by email.  
	email   : arthur.poulet AT cryptolab.net [OpenPGP : 0x6D9EA34A]  

