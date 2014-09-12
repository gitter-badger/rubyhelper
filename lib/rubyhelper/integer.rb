#!/usr/bin/env ruby
#encoding: utf-8

module IntegerHelper

  # return true if not odd
  #
  # @return [true or false]
  def peer?
    not odd?
  end

end

class Integer
  prepend IntegerHelper
end
