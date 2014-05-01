#encoding: utf-8

class Array

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
  
  private
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
end
