#!/usr/bin/env ruby
#encoding: utf-8

module NumericHelper

  # get - or + function of the sign of the integer
  #
  # @param plus [Object] a value if self >= 0
  # @param less [Object] a value if self < 0
  # @return [Object] the param plus or less if self >= 0 or < 0
  def sign(plus="+", less="-")
    return (self < 0) ? (less) : (plus)
  end

  # Get the self value or minimum_value if greater than self
  #
  # @raise [ArgumentError] if the passed value is not an integer
  # @return [Numeric] self if self >= min else min
  def min(minimum_value)
    raise ArgumentError unless minimum_value.is_a? Numeric
    return self >= minimum_value ? self : minimum_value
  end

  # see {#min}
  #
  # @return [Numeric]
  def min!(minimum_value)
    return self.replace(self.min(minimum_value))
  end

  # Get the self value or maximum_value if lesser than self
  #
  # @raise [ArgumentError] if the passed value is not an integer
  # @return [Numeric] self if self <= max else max
  def max(maximum_value)
    raise ArgumentError unless maximum_value.is_a? Numeric
    return self <= maximum_value ? self : maximum_value
  end

  # see {#max}
  #
  # @return [Numeric]
  def max!(maximum_value)
    return self.replace(self.min(maximum_value))
  end

  # return true if peer
  # you can see also {#odd?}
  #
  # @return [true or false]
  def peer?
    return (self % 2).zero? ? true : false
  end

  # return true if odd
  # you can see also {#peer?}
  #
  # @return [true or false]
  def odd?
    not peer?
  end

  # Not ready yet
  #
  # Resolve a simple 2sd degree equation
  #
  # @param a [Numeric] a*x**2+b*x+c = y
  # @param b [Numeric] a*x**2+b*x+c = y
  # @param c [Numeric] a*x**2+b*x+c = y
  # @return [Array of Numeric]
  # def self.solve_2d a, b=0, c=0
  # end

end

class Numeric
  prepend NumericHelper
end
