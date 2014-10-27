#encoding: utf-8

#CRYXOR DEPENDENCY
require 'digest'

module StringHelper

  # TODO : raise error on invalid utf-8 param replace
  # Force utf-8 encoding (shortcut ;) ! )
  #
  # @raise [ArgumentError] if replace is not a String
  # @param replace [String] replace invalids chars by other chas
  # @return [String] utf-8 string
  def utf8 replace=''
    raise ArgumentError, 'replace is not a valid char (String)' unless replace.is_a? String
    return self.encode('UTF-8', invalid: :replace, undef: :replace, replace: replace)
  end

  # see {#utf8}
  #
  # @raise [ArgumentError] if replace is not a String (via {#utf8})
  # @return [String] utf-8 valid string
  def utf8!
    return self.replace(self.utf8)
  end

  # UTF-8 encoding and replace invalid chars.
  # Remove accents from the string (convert to ASCII chars !)
  # And then, change the case as first argument if not nil
  #
  # @raise [ArgumentError] if replace is not a String (via {#p} and {#utf8})
  # @param case_mod [Symbol] :upcase, :capitalize or :downcase or nil for no case change
  # @param replace [String] if a char is not utf8 valid, character will replace it
  # @return [String] self changed without accents and non-utf-8 chars
  def to_plain(case_mod = nil, replace='')
    return self.p(replace).utf8(replace).to_case(case_mod)
  end

  # see {#to_plain}
  #
  # @raise [ArgumentError] if replace is not a String (via {#to_plain})
  # @return [String]
  def to_plain!(case_mod = nil, replace='')
    return self.replace(self.to_plain(case_mod, replace))
  end

  # Remove accents from the string, and replace it by the same letter in ASCII
  # Note : it doesn't remove non ASCII characters
  #
  # @raise [ArgumentError] if replace is not a String (via {#utf8})
  # @param replace [String] replace by character default case
  # @return [String] self cahnged
  def p(replace='')
    begin
      return self.tr("ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
                     "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
    rescue Encoding::CompatibilityError => e
      return self.utf8(replace)
    end
  end

  # see {#p}
  #
  # @raise [ArgumentError] if replace is not a String (via {#p})
  # @return [String]
  def p!(replace='')
    return self.replace(self.p(replace))
  end

  # permit to do upcase/downcase/capitalize easier with a simple param
  #
  # @param case_mod [Symbol] :upcase, :capitalize, :classic or :downcase or nil if no case change. The capitalize correspond to {#scapitalize} and classic to {#capitalize}
  # @return [String] self changed to downcase, upcase, capitalize or classic_capitalize
  def to_case(case_mod = :downcase)
    case case_mod
    when :upcase
      return self.upcase
    when :downcase
      return self.downcase
    when :capitalize
      return self.scapitalize
    when :classic
      return self.capitalize
    else
      return self
    end
  end

  # see {#to_case}
  #
  # @return [String]
  def to_case!(case_mod = :downcase)
    return self.replace(self.to_case(case_mod))
  end

  # Return a simple ascii string. Invalid characters will be replaced by "replace" (argument)
  # Accents are removed first and replaced by the equivalent ASCII letter (example : 'é' => 'e')
  # no raise error on {#p} because of default doesn't let it happen ;)
  #
  # @raise [ArgumentError] if replace is not a String char
  # @param replace [String] a caracter to replace non-ascii chars
  # @param case_mod [Symbol] :upcase, :capitalize or :downcase or nil if no case change
  # @return [String] self changed
  def to_ascii(replace='', case_mod = nil)
    raise ArgumentError, "Argument replace is not a String char" unless replace.is_a? String
    s = String.new
    self.p.each_char do |c|
      s += ((c.ord > 255) ? (replace) : (c))
    end
    return s.to_case(case_mod)
  end

  # CRYXOR (one time pad dirt application)
  #
  # @param k [String]
  # @raise [ArgumentError] if key is not a valid String
  # @return [String] encrypted mail
  def ^(k)
    raise ArgumentError, "The key MUST BE a String" unless k.is_a? String
    str = ""
    self.size.times do |i|
      str << (self[i].ord ^ k[i % k.size].ord).chr
    end
    return str
  end

  # SHA2 shortcuts
  # see {Digest::SHA2#hexdigest}
  #
  # @return [String] the sha2 hash value of self
  def sha2
    Digest::SHA2.hexdigest(self)
  end

  # see {#sha2}
  #
  # @return [String]
  def sha2!
    return self.replace(self.sha2)
  end

  # Get a str with a static length.
  # If the str size > n, reduce the str (keep str from the (param place) )
  # You should check the test files for examples
  # if the (param place) is not valid, the function will just return self
  # Note : {#center} {#ljust} and {#rjust} do a similar work.
  #
  # @raise [ArgumentError] if n in not an integer/char a String
  # @param n [Integer] number of char
  # @param char [String] char to replace if the initial str is too short
  # @param place [Symbol] :begin/:front/:left :end/:back/:rigth :center/:middle
  # @return [String]
  def static(n, char =' ', place = :right)
    raise ArgumentError, 'char is not an Char (String)' unless char.is_a? String
    raise ArgumentError, 'n is not an Integer' unless n.is_a? Integer
    char = char[0] || " " # get only the first char or a space if empty
    if size < n
      case place
      when :begin, :front, :left
        return char * (n - size).to_i + self
      when :center, :middle
        return char * ((n - size) / 2) + self + char * ((n - size) / 2 + (n - size) % 2)
      when :end, :back, :right
        return self + char * (n - size).to_i
      else
        return self
      end
    else
      case place
      when :begin, :front, :left
        return self[0...n]
      when :center, :middle
        return self[((-(size() +n - 1)) / 2)..((-(size() -n + 1)) / 2)]
      when :end, :back, :right
        return self[(-n)..(-1)]
      else
        return self
     end
    end
  end

  # see {#static}
  #
  # @raise [ArgumentError] via {#static}
  def static!(n, char=' ')
    return self.replace(self.static(n, char))
  end

  # Returns true or false if the string if "true" or "false". else nil
  #
  # @return [true or false or nil]
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

  # indicate if the string is "true"
  #
  # @return [true or false]
  def true?
    return (self == "true")
  end

  # indicate if the string is "false"
  #
  # @return [true or false]
  def false?
    return (self == "false")
  end

  # Capitalize a sequence (each word)
  #
  # @return [String] capitalized_string
  def scapitalize
    return self.split.map(&:capitalize).join(' ')
  end

  # see {#scapitalize}
  #
  # @return [String]
  def scapitalize!
    return self.replace(self.scapitalize)
  end

  # by bakhou_r@epitech.eu
  # split th string and only keep the non empty striped values
  #
  # @param sep [String] separator
  # @param sep [Regexp] separator
  # @return [Array]
  def splity(sep = "\n")
    raise ArgumentError, "sep must be a string or a regex" unless sep.is_a? String or sep.is_a? Regexp
    return self.split(sep).map{|e| ((e.strip.empty?) ? (nil) : (e.strip))}.compact
  end

  # see {#splity}
  #
  # @param sep [String]
  # @return [Array]
  def splity!(sep)
    return self.replace(self.splity(sep))
  end

end

class String
  prepend StringHelper
end
