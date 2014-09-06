#encoding: utf-8

module ArrayHelper

  # This function return a pretty good string. Like join but with an array
  # You can use an array as separator : [",", " "] will successively ',' and ' '
  # Exemple : ["a", "b", "c"].joini(["x", "y"]) => "axbyc"
  # == Errors:
  #     - ArgumentError : if sep in not an array
  # == Params:
  #     - sep: (Array) array of separator
  # == Returns:
  #     - str: (String) string joined
  def joini sep
    raise ArgumentError, 'Argument is not an array' unless sep.is_a? Array
    str = String.new
    i = 0
    self.each do |e|
      str = str + e.to_s + sep[i % sep.size].to_s
      i += 1
    end
    return str[0..-2]
  end

  # Do the sum of an array of integer.
  # if there is not integer, it will do a to_s.to_i of the element to try
  # find an integer in the element. else, replace by a simple 0
  def sum
    return (self.size > 0) ? (self.map{|e| e.to_s.to_i}.reduce(:+)) : (0)
  end

  # lke sum by with a to_f instead of to_i
  def sumf
    return (self.size > 0) ? (self.map{|e| e.to_s.to_f}.reduce(:+)) : (0.0)
  end

  # Use the sum and divide by the size of the array. 0 if no element.
  def average
    return (self.size > 0) ? (self.sum / self.size) : (0)
  end

  # Same than average but use to_f instead of to_i
  def averagef
    return (self.size > 0) ? (self.sumf / self.size.to_f) : (0.0)
  end

  # get the n higher values of the array
  # == Errors:
  #     - ArgumentError : if n in not an integer
  # == Params:
  #     - n: (Integer) number of elements
  def maxs(n=1)
    raise ArgumentError, 'Argument is not an integer' unless n.is_a? Integer
    n = 1 if n < 1
    n = self.size if n > self.size
    return Array(self.sort[(-n)..(-1)])
  end

  # get the n lower values of the array
  # == Errors:
  #     - ArgumentError : if n in not an integer
  # == Params:
  #     - n: (Integer) number of elements
  def mins(n=1)
    raise ArgumentError, 'Argument is not an integer' unless n.is_a? Integer
    n = 1 if n < 1
    n = self.size if n > self.size
    return Array(self.sort[0..(n-1)])
  end

  # The Same as compact but remove empty string too
  def compacti
    return self.map{|e| e = nil if e == "" ; e}.compact
  end
  def compacti!
    return self.replace(self.compacti)
  end

end

class Array
  prepend ArrayHelper
end
