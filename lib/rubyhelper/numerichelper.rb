#!/usr/bin/env ruby
#encoding: utf-8

module NumericHelper
  
  # get - or + function of the sign of the integer
  def sign
    return (self < 0) ? ("-") : ("+")
  end
  
  # Errors
  #	ArgumentError : if the passed value is not an integer
  # Returns
  #	value: (Numeric) self if self >= min else min
  def min(minimum_value)
    raise ArgumentError unless minimum_value.is_a? Numeric
    return self >= minimum_value ? self : minimum_value
  end
  def min!(minimum_value)
    return self.replace(self.min(minimum_value))
  end
  
  # Errors
  #	ArgumentError : if the passed value is not an integer
  # Returns
  #	value: (Numeric) self if self <= max else max
  def max(maximum_value)
    raise ArgumentError unless maximum_value.is_a? Numeric
    return self <= maximum_value ? self : maximum_value
  end
  def max!(maximum_value)
    return self.replace(self.min(maximum_value))
  end
  
end

class Numeric
  prepend NumericHelper
end
