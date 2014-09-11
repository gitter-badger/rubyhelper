#encoding: utf-8

module StringNumericHelper

  # improvement of to_f to count "," caracter as "."
  #
  # @return [Float] like {Integer#to_f}
  def to_fi
    return self.gsub(',', '.').to_f
  end

  # to_i with delimiter to remove
  # Example : "12.000.000".to_ii => 12000000
  #
  # @param char [String] char to delete (default : ' ')
  # @raise [ArgumentError] If (param char) is not a String
  # @return [Integer] like {Integer#to_i]
  def to_ii(char=' ')
    raise ArgumentError, "Argument is not a String" unless char.is_a? String
    self.delete(char).to_i
  end

  # get only the digits and + - symbols in the string
  # you should see also {#get_float}
  #
  # @param sign [true or false or :less ] if true, keep the - and + signs, if :less, only keep -
  # @return [String] epured string
  def get_int(sign = true)
    return self.gsub(/[^\-\+\d]/, "") if sign == true
    return self.gsub(/[^\-\d]/, "") if sign == :less
    return self.gsub(/[^\d]/, "")
  end

  # see {#get_int}
  #
  # @return [String]
  def get_int!(sign = true)
    return self.replace(self.get_int(sign))
  end

  # get only the digits and + - symbols in the string of the first group of digits
  # you should see also {#get_int} {#get_ints} and {#get_1float}
  #
  # @param sign [true or false or :less ] if true, keep the - and + signs, if :less, only keep -
  # @return [String] epured string
  def get_1int(sign = true)
    return self.match(/([\d\-\+]*\d[\d\-\+]*)/).to_a[1].to_s.get_int(sign) if sign == true
    return self.match(/([\d\-  ]*\d[\d\-]*)/).to_a[1].to_s.get_int(sign) if sign == :less
    return self.match(/(\d+)/).to_a[1].to_s.get_int(sign)
  end

  # see {#get_1int}
  #
  # @return [String]
  def get_1int!(sign = true)
    return self.replace(self.get_1int(sign))
  end

  # get all integer groups
  # if sep is a sign and the param sign == true, then theses signs will be splited first
  # see also {#get_floats} and {#get_int}
  #
  # @param sep [String or Regexp] separator
  # @param sign [true or false or :less ] if true, keep the - and + signs, if :less, only keep -
  # @raise ArgumentError if sep is not a String
  # @return [Array of String]
  def get_ints(sep = ' ', sign = true)
    raise ArgumentError, "sep must be a String" unless sep.is_a? String or sep.is_a? Regexp
    return self.split(sep).map{|e| e.get_int(sign)}
  end

  # get only the digits and + - . , symbols in the string
  # you can also see {#to_fi} to turn the String into a Float
  # see als {#get_1float} {#get_floats} and {#get_int}
  #
  # @param sign [true or false or :less ] if true, keep the - and + signs, if :less, only keep -
  # @return [String] epured_string
  def get_float(sign = true)
    return self.gsub(/[^\-\+\d\.\,]/, "") if sign == true
    return self.gsub(/[^\-\d\.\,]/, "") if sign == :less
    return self.gsub(/[^\d\.\,]/, "")
  end

  # see {#get_float}
  #
  # @return [String]
  def get_float!(sign = true)
    return self.replace(self.get_float(sign))
  end

  # get only the digits and + - . , symbols in the string of the first group of digits
  # you should see also {#get_float} and {#get_1int}
  #
  # @param sign [true or false or :less ] if true, keep the - and + signs, if :less, only keep -
  # @return [String] epured string
  def get_1float(sign = true)
    return self.match(/([\d\.,\-\+]*\d[\d\.,\-\+]*)/).to_a[1].to_s.get_float(sign) if sign == true
    return self.match(/([\d\.,\-]*\d[\d\.,\-]*)/).to_a[1].to_s.get_float(sign) if sign == :less
    return self.match(/([\d\.,]*\d[\d\.,]*)/).to_a[1].to_s.get_float(sign)
  end

  # get all floats groups
  # if sep is a sign and the param sign == true, then theses signs will be splited first
  # see also {#get_float} and {#get_ints}
  #
  # @param sep [String or Regexp] separator
  # @param sign [true or false or :less ] if true, keep the - and + signs, if :less, only keep -
  # @raise ArgumentError if sep is not a String
  # @return [Array of String]
  def get_floats(sep = ' ', sign = true)
    raise ArgumentError, "sep must be a String" unless sep.is_a? String or sep.is_a? Regexp
    return self.split(sep).map{|e| e.get_float(sign)}
  end

  # see {#get_1float}
  #
  # @return [String]
  def get_1float!(sign = true)
    return self.replace(self.get_1float(sign))
  end

  # transforme the string into an float in m² if containing "ha"
  #
  # @return [Float]
  def ha2m2
    return self.gsub("m2", "").get_1float.to_fi unless self.match(/(\A|[^[:alpha:]])ha(\Z|[^[:alpha:]])/i)
    return self.gsub("m2", "").get_1float.to_fi * 10_000 unless self.match(/(\A|[^[:alpha:]])m(2|²)(\Z|[^[:alpha:]])/i)
    return self.gsub("m2", "").get_1float.to_fi
  end

end

class String
  prepend StringNumericHelper
end