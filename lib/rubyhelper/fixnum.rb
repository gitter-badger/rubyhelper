#!/usr/bin/env ruby
#encoding: utf-8

module FixnumHelper

  # return true if not odd
  #
  # @return [true or false]
  def peer?
    not odd?
  end

end

class Fixnum
  prepend FixnumHelper
end

class Fixnum
  alias_method :old_add, :+
  def +(p)
    return self.to_s + p if p.is_a? String
    return self.old_add(p)
  end
end
