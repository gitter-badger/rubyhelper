#encoding: utf-8

#CRYXOR DEPENDENCY
require 'digest'

module StringHelper

  # UTF-8 encoding and replace invalid chars, Remove accents from the string. Change the case as first argument if not nil
  # == Params
  #     case_mod: nil (not changement), :upcase, :capitalize or :downcase
  #     replace: if a char is not utf8 valid, character will replace it
  def to_plain(case_mod = nil, replace= " ")
    return self.p.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').to_case(case_mod)
  end

  # Remove accents from the string, and replace it by the same letter in ASCII
  def p
    return self.tr("ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
                   "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
  end
  def p!
    return self.replace(self.p)
  end

  # == Params
  #     case_mod: nil (not changement), :upcase, :capitalize or :downcase
  # permit to do upcase/downcase/capitalize easier with a simple param
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
  def to_case!(case_mod = :downcase)
    return self.replace(self.to_case(case_mod))
  end

  # Return a simple ascii string. Invalid characters will be replaced by "replace" (argument)
  # Accents are removed first and replaced by the equivalent ASCII letter
  # == Params
  #     replace: a caracter to replace non-ascii chars
  #     case_mod: nil (not changement), :upcase, :capitalize or :downcase
  def to_ascii(replace="", case_mod = nil)
    s = String.new
    self.p.each_char do |c|
      s += ((c.ord > 255) ? (replace.to_s) : (c))
    end
    return s.to_case(case_mod)
  end

  # improvement of to_f to count "," caracter as "."
  def to_f
    s = self.dup
    self.gsub!(',', '.')
    f = super
    self.replace(s)
    return f
  end

  # to_i with delimiter
  # Example : "12.000.000".to_ii => 12000000
  def to_ii(char=' ')
    self.delete(char.to_s).to_i
  end

  #CRYXOR (one time pad dirt application)
  def ^(k)
    str = ""
    self.size.times do |i|
      str << (self[i].ord ^ k[i % k.size].ord).chr
    end
    return str
  end

  #SHA2 shortcuts
  def sha2
    Digest::SHA2.hexdigest(self)
  end
  def sha2!
    return self.replace(self.sha2)
  end

  # Get a str with a static length.
  # If the str size > n, reduce the str (keep str from the (param place) )
  # You should check the test files for examples
  # == Params
  #     n: number of char
  #     char: char to replace if the initial str is too short
  #     place: :begin/:front :end/:back :center/:middle
  # == Errors
  #     ArgumentError : if n in not an integer/char a String
  def static(n, char=' ', place= :back)
    raise ArgumentError, 'char is not an Char (String)' unless char.is_a? String and char[0] != nil
    raise ArgumentError, 'n is not an Integer' unless n.is_a? Integer
    char = char[0] # get onlu tje first char
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
  # == Params
  #     sign: (true/false) if true, keep the - and + signs
  def get_int(sign = true)
    return self.gsub(/[^\-\+\d]/, "") if sign == true
    return self.gsub(/[^\d]/, "")
  end
  def get_int!(sign = true)
    return self.replace(self.get_int(sign))
  end

  #as get_int but with . and ,
  # == Params
  #     sign: (true/false) if true, keep the - and + signs
  def get_float(sign = true)
    return self.gsub(/[^\-\+\d\.\,]/, "") if sign == true
    return self.gsub(/[^\d\.\,]/, "") if sign == true
  end
  def get_float!(sign = true)
    return self.replace(self.get_float(sign))
  end

  # Capitalize a sequence
  def scapitalize
    return self.split.map(&:capitalize).join(' ')
  end
  def scapitalize!
    return self.replace(self.scapitalize)
  end

end

class String
  prepend StringHelper
end
