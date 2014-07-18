#!/usr/bin/env ruby
#encoding: utf-8

module IntegerHelper

  def sign
    return (self < 0) ? ("-") : ("+")
  end

end

class Integer
  prepend IntegerHelper
end
