# rubyhelper

[![Gem Version](https://badge.fury.io/rb/rubyhelper.svg)](http://badge.fury.io/rb/rubyhelper)
  
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
```ruby
	h.delete_if{|k| [:a].include? k}
```
