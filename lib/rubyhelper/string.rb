#encoding: utf-8

#CRYXOR DEPENDENCY
require 'digest'

module StringHelper

  # Force utf-8 encoding (shortcut ;) ! )
  # == Params:
  #     - replace: (String) replace invalids chars by other chas
  # == Returns:
  #     - self: (String) utf-8 string
  def utf8 replace=''
    return self.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: replace)
  end

  # see #utf8
  def utf8!
    return self.replace(self.utf8)
  end

  # UTF-8 encoding and replace invalid chars.
  # Remove accents from the string (convert to ASCII chars !)
  # And then, change the case as first argument if not nil
  # == Params:
  #     - case_mod: nil (not changement), :upcase, :capitalize or :downcase
  #     - replace: (String) if a char is not utf8 valid, character will replace it
  # == Returns:
  #     - self: (String)
  def to_plain(case_mod = nil, replace='')
    return self.p(replace).utf8(replace).to_case(case_mod)
  end

  # see #to_plain
  def to_plain!(case_mod = nil, replace='')
    return self.replace(self.to_plain(case_mod, replace))
  end

  # Remove accents from the string, and replace it by the same letter in ASCII
  # == Params:
  #     - replace: (String) replace by character default case
  # == Returns:
  #     - self: (String)
  def p(replace='')
    begin
      return self.tr("ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
                     "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
    rescue Encoding::CompatibilityError => e
      return self.utf8(replace)
    end
  end

  # see #p
  def p!(replace='')
    return self.replace(self.p(replace))
  end

  # permit to do upcase/downcase/capitalize easier with a simple param
  # == Params:
  #     - case_mod: nil (not changement), :upcase, :capitalize or :downcase
  def to_case(case_mod = :downcase)
    case case_mod
    when :upcase
      return self.upcase
    when :downcase
      return self.downcase
    when :capitalize
      return self.capitalize
    else
      return self
    end
  end

  # see #to_case
  def to_case!(case_mod = :downcase)
    return self.replace(self.to_case(case_mod))
  end

  # Return a simple ascii string. Invalid characters will be replaced by "replace" (argument)
  # Accents are removed first and replaced by the equivalent ASCII letter
  # == Params:
  #     - replace: a caracter to replace non-ascii chars
  #     - case_mod: nil (not changement), :upcase, :capitalize or :downcase
  # == Returns:
  #     - self: (String)
  def to_ascii(replace="", case_mod = nil)
    s = String.new
    self.p.each_char do |c|
      s += ((c.ord > 255) ? (replace.to_s) : (c))
    end
    return s.to_case(case_mod)
  end

  # improvement of to_f to count "," caracter as "."
  # == Params:
  #       none
  # == Returns:
  #     - float: (Float)
  def to_fi
    return self.gsub(',', '.').to_f
  end

  # to_i with delimiter to remove
  # Example : "12.000.000".to_ii => 12000000
  # == Params:
  #     - char: char to delete (default : ' ')
  # == Returns:
  #     - integer: (Integer)
  # == Errors:
  #     ArgumentError: If (param char) is not a String
  def to_ii(char=' ')
    raise ArgumentError, "Argument is not a String" unless char.is_a? String
    self.delete(char).to_i
  end

  # CRYXOR (one time pad dirt application)
  def ^(k)
    str = ""
    self.size.times do |i|
      str << (self[i].ord ^ k[i % k.size].ord).chr
    end
    return str
  end

  # SHA2 shortcuts
  # see #Digest::SHA2.hexdigest
  def sha2
    Digest::SHA2.hexdigest(self)
  end

  # see #sha2
  def sha2!
    return self.replace(self.sha2)
  end

  # Get a str with a static length.
  # If the str size > n, reduce the str (keep str from the (param place) )
  # You should check the test files for examples
  # == Params:
  #     - n: number of char
  #     - char: char to replace if the initial str is too short
  #     - place: :begin/:front :end/:back :center/:middle
  # == Errors:
  #     - ArgumentError : if n in not an integer/char a String
  def static(n, char=' ', place= :back)
    raise ArgumentError, 'char is not an Char (String)' unless char.is_a? String
    raise ArgumentError, 'n is not an Integer' unless n.is_a? Integer
    char = char[0] || " " # get only the first char or a space if empty
    if size < n
      case place
      when :begin, :front
        return char * (n - size).to_i + self
      when :center, :middle
        return char * ((n - size) / 2) + self + char * ((n - size) / 2 + (n - size) % 2)
      else
        return self + char * (n - size).to_i
      end
    else
      case place
      when :begin, :front
        return self[0...n]
      when :center, :middle
        return self[((-(size() +n - 1)) / 2)..((-(size() -n + 1)) / 2)]
      else
        return self[(-n)..(-1)]
      end
    end
  end
  def static!(n, char=' ')
    return self.replace(self.static(n, char))
  end

  #Returns true or false if the string if "true" or "false". else nil
  # == Params:
  #       none
  # == Returns:
  #     - true/false
  def to_t
    case self
    when "true"
      return true
    when "false"
      return false
    else
      return nil
    end
  end

  #get only the digits and symbols in the string
  # == Params:
  #     - sign: (true/false) if true, keep the - and + signs
  # == Return:
  #     epured_string: (String)
  def get_int(sign = true)
    return self.gsub(/[^\-\+\d]/, "") if sign == true
    return self.gsub(/[^\d]/, "")
  end

  # see #get_int
  def get_int!(sign = true)
    return self.replace(self.get_int(sign))
  end

  #as get_int but with . and ,
  # == Params:
  #     - sign: (true/false) if true, keep the - and + signs
  # == Returns:
  #     epured_string: (String)
  def get_float(sign = true)
    return self.gsub(/[^\-\+\d\.\,]/, "") if sign == true
    return self.gsub(/[^\d\.\,]/, "") if sign == true
  end

  # see #get_float
  def get_float!(sign = true)
    return self.replace(self.get_float(sign))
  end

  # Capitalize a sequence (each word)
  # == Params:
  #       none
  # == Returns:
  #     capitalized_string: (String)
  def scapitalize
    return self.split.map(&:capitalize).join(' ')
  end

  # see #scapitalize
  def scapitalize!
    return self.replace(self.scapitalize)
  end

end

class String
  prepend StringHelper
end