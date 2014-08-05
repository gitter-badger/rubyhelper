#encoding: utf-8

#CRYXOR DEPENDENCY
require 'digest'

module StringHelper

  def to_plain
    return self.tr(
      "ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸŹźŻżŽž",
      "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIIIiiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnNnnNnOOOOOOooooooOoOoOoRrRrRrSsSsSsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwYyyYyYZzZzZz")
  end
  
  def to_case(case_mod = :downcase)
    if case_mod == :upcase
      return self.to_plain.upcase
    else
      return self.to_plain.downcase
    end
  end

  def to_f
    self.gsub!(',', '.')
    super
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

  #STATIC
  def static(n, char=' ')
    if self.size < n
      return self + char * (n - self.size).to_i
    else
      return self[0...n]
    end
  end

  #Returns true or false
  def to_t
    if self == "true"
      return true
    else
      return false
    end
  end

end

class String
  prepend StringHelper
end
