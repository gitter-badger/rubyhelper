#encoding: utf-8

#CRYXOR DEPENDENCY
require 'digest'

module StringHelper

  # == Params
  #     case_mode:
  #             if :upcase => change the case with.upcase
  #             if :downcase => change the case to with.downcase
  # Remove accents from the string. Change the case as first argument
  def to_plain(case_mod = nil)
    string = self.tr("ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
                     "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
    return s.to_case(case_mode)
  end

  # permit to do upcase/downcase easier with a simple param
  def to_case(case_mod = :downcase)
    case case_mod
    when :upcase
      return string.upcase
    when :downcase
      return string.downcase
    else
      return string
    end
  end

  # == Params
  #     case_mod: nil (not changement), :upcase or :downcase
  #     replace: a caracter to replace non-ascii chars
  # return a simple ascii string. Invalid characters will be replaced by "replace" (argument)
  def to_ascii(case_mod = nil, replace="")
    s = String.new
    self.each_char do |c|
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

  #To_i with delimiter
  def to_i_wd(char=' ')
    self.delete(char.to_s).to_i
  end

  #CRYXOR
  def ^(k)
    str = ""
    self.size.times do |i|
      str << (self[i].ord ^ k[i % k.size].ord).chr
    end
    return str
  end

  #SHA2
  def sha2
    Digest::SHA2.hexdigest(self)
  end

  # ==Param
  #     n: number of char
  #     char: char to replace if the initial str is too short
  # Get a str with a static length
  def static(n, char=' ')
    if self.size < n
      return self + char * (n - self.size).to_i
    else
      return self[0...n]
    end
  end

  #Returns true or false if the string if "true" or "false"
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
  def get_int
    return self.gsub(/[^\d\-\+]/, "")
  end

  #as get_int but with . and ,
  def get_float
    return self.gsub(/[^\d\.\,\-\+]/, "")
  end

end

class String
  prepend StringHelper
end
