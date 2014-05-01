#encoding: utf-8

#CRYXOR DEPENDENCY
require 'digest'

class String

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

end
