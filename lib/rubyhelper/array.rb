#encoding: utf-8

module ArrayHelper

  # This function return a pretty good string. Like join but with an array
  # You can use an array as separator : [",", " "] will successively ',' and ' '
  # Exemple : ["a", "b", "c"].joini(["x", "y"]) => "axbyc"
  #
  # @raise [ArgumentError] if sep in not an array or a string
  # @param sep [Array] array of separators
  # @param sep [String] uniq separator (join alias {#join})
  # @return [String] string joined
  def joini sep
    if sep.is_a? Array
      str = String.new
      i = 0
      self.each do |e|
        str = str + e.to_s + sep[i % sep.size].to_s
        i += 1
      end
      return str[0..-2]
    elsif sep.is_a? String
      return self.join(sep)
    else
      raise ArgumentError, 'Argument is not an array or a string'
    end
  end

  # Do the sum of an array of integer.
  # if there is not integer, it will do a to_s.to_i of the element to try
  # find an integer in the element. else, replace by a simple 0
  # If the argument toadd is no nill, then the self.size firsts elements
  # will be added to self and returned
  # examples: [1,2,3].sum([1,1]) => [2,3,3]
  # examples: [1,2].sum([1,1,1]) => [2,3]
  #
  # @param toadd [Array] if not nil, the array will be added
  # @return [Integer] the sum of each element (converted via .to_s.to_i)
  # @return [Array] an array wich contain the sum of a1[i] + a2[i]
  def sum(toadd=nil)
    return (self.size > 0) ? (self.map{|e| e.to_s.to_i}.reduce(:+)) : (0) if toadd.nil?
    raise ArgumentError, 'Argument is not an Array' unless toadd.is_a? Array
    return self.zip(toadd).map{|pair| pair.map{|e| e.to_s.to_i}.reduce(&:+) }
  end

  # like {#sum} by with a to_f instead of to_i
  #
  # @return [Float] the sum of each element (converted via .to_s.to_f)
  # @return [Array] an array wich contain the sum of a1[i] + a2[i]
  def sumf(toadd=nil)
    return (self.size > 0) ? (self.map{|e| e.to_s.to_f}.reduce(:+)) : (0.0) if toadd.nil?
    raise ArgumentError, 'Argument is not an Array' unless toadd.is_a? Array
    return self.zip(toadd).map{|pair| pair.map{|e| e.to_s.to_f}.reduce(&:+) }
  end

  # Use the {#sum} and divide by the size of the array.
  #
  # @return [Integer] self.sum / self.size. 0 if no elements
  def average
    return (self.size > 0) ? (self.sum / self.size) : (0)
  end

  # Same than {#average} but use to_f instead of to_i
  #
  # @return [Float] self.sumf / self.size. 0.0 if no elements
  def averagef
    return (self.size > 0) ? (self.sumf / self.size.to_f) : (0.0)
  end

  # get the n higher values of the array
  #
  # @raise [ArgumentError] if n in not an integer
  # @raise [ArgumentError] if n is lesser than 1
  # @param n [Integer] number of elements
  def maxs(n=1)
    raise ArgumentError, 'Argument is not an integer' unless n.is_a? Integer
    raise ArgumentError, 'Argument is lesser than 1' unless n >= 1
    n = self.size if n > self.size
    return Array(self.sort[(-n)..(-1)])
  end

  # get the n lower values of the array
  #
  # @raise [ArgumentError] if n in not an integer
  # @raise [ArgumentError] if n is lesser than 1
  # @param n [Integer] number of elements
  def mins(n=1)
    raise ArgumentError, 'Argument is not an integer' unless n.is_a? Integer
    raise ArgumentError, 'Argument is lesser than 1' unless n >= 1
    n = 1 if n < 1
    n = self.size if n > self.size
    return Array(self.sort[0..(n-1)])
  end

  # Same as {#compact} but remove empty string too
  # see #compact
  #
  # @return [Array] compacted array
  def compacti
    return self.map{|e| e == "" ? nil : e}.compact
  end

  # see {#compacti}
  #
  # @return [Array]
  def compacti!
    return self.replace(self.compacti)
  end

  # examples : [:a, :b, :c, 1, 2, 3] => [[:a, 1], [:b, 2], [:c, 3]]
  # examples : [:a, :b, :c, :d, 1, 2, 3] => [[:a, 1], [:b, 2], [:c, 3], [:d, nil]]
  # examples : [:a, :b, :c, 1, 2, 3, 4] => [[:a, 2], [:b, 3], [:c, 4], [1, nil]]
  # The array will be transformed into an array of couple ([x,y])
  # with [0e, N/2e] where N/2e is the element at size/2. If the array have
  # an odd number of elements, it will add a nil value at the end.
  #
  # @return [Array] mirrored array
  def mirror
    return self[0..(size/2+size%2-1)].zip(self[(size/2+size%2)..-1])
  end

end

class Array
  prepend ArrayHelper
end
