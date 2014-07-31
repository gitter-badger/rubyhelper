#encoding: utf-8

module ArrayHelper

  # A simple function like to_s(), but return a clean String
  # for exemple :
  #    [1,2,3].to_clean_s(" ; ")
  # => "1 ; 2 ; 3"
  # ==Parameters:
  #   sep:
  #   A String to separe each element (or an Array, see to_clean_s_with_array)
  def to_clean_s(sep=' ')
    return to_clean_s_with_array(sep) if sep.is_a?Array
    to_clean_s_with_string(sep.to_s)
  end
  
  def to_clean_s_with_string sep
    str = String.new
    self.each{|e| str = str + e.to_s + sep.to_s}
    return str[0..(-sep.size - 1)]
  end
  
  # You can use an array as separator : [",", " "] will successively ',' and ' '
  def to_clean_s_with_array sep
    str = String.new
    i = 0
    self.each do |e|
      str = str + e.to_s + sep[i % sep.size].to_s
      i += 1
    end
    return str[0..(-sep.size - 1)]
  end

  def sum
    return (self.size > 0) ? (self.map{|e| e.to_s.to_i}.reduce(:+)) : (0)
  end

  def sumf
    return (self.size > 0) ? (self.map{|e| e.to_s.to_f}.reduce(:+)) : (0.0)
  end

  def average
    return (self.size > 0) ? (self.sum / self.size) : (0)
  end

  def averagef
    return (self.size > 0) ? (self.sumf / self.size.to_f) : (0.0)
  end

  #TODO benchmark with sort{|e| -e}
  def maxs(n=1)
    return Array(self.sort[(-n)..(-1)])
  end

end

class Array
  prepend ArrayHelper
end
