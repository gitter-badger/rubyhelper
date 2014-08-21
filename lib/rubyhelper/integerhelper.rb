#!/usr/bin/env ruby
#encoding: utf-8

module IntegerHelper

  # get - or + function of the sign of the integer
  def sign
    return (self < 0) ? ("-") : ("+")
  end

end

class Integer
  prepend IntegerHelper
end
