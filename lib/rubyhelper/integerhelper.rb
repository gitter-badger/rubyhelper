#!/usr/bin/env ruby
#encoding: utf-8

module IntegerHelper

  # get - or + function of the sign of the integer
  def sign
    return (self < 0) ? ("-") : ("+")
  end

  # Returns
  #	value: (Integer) self if self >= min else min
  def min(minimum_value)
    return self >= minimum_value ? self : minimum_value
  end
  def min!(minimum_value)
    return self.replace(self.min(minimum_value))
  end

  # Returns
  #	value: (Integer) self if self <= max else max
  def max(maximum_value)
    return self <= maximum_value ? self : maximum_value
  end
  def max!(maximum_value)
    return self.replace(self.min(maximum_value))
  end

end

class Integer
  prepend IntegerHelper
end
