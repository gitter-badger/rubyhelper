#encoding: utf-8

require 'pry'

module VersionHelper

  class Version

    attr_accessor :v

    # == Params:
    #	arg : list of arguments
    #		Integer : 1234 => 1.2.3.4
    #		String : "1.2-3" => 1.2.3
    #		Array : like multiple arguments
    #		multiple : each argument is converted to a number
    #			1,2,3 => 1.2.3
    def initialize(*arg)
      @v = []
      if arg.size == 1
        v = arg.first
        case v.class.to_s
        when 'String'
          v.gsub!(/\A\D/, '')
          v.gsub!(/\D/, '.')
          @v = v.split('.').map{|e| e.to_i}
        when 'Array'
          @v = v.map{|e| e.to_i}
        when 'Fixnum'
          v = v.to_i
          loop do
            break if v == 0
            @v << (v % 10)
            v /= 10
          end
        else
          raise ArgumentError, v.class.to_s
        end
      end
      if arg.size > 1
        @v = arg.map{|e| e.to_i}
      end
    end

    def incr!(n=-1)
      @v[n] = @v[n] += 1
    end

    def decr!(n=-1)
      @v[n] = @v[n] -= 1
    end

    def to_a
      return Version.to_a(self)
    end

    def to_s
      return Version.to_s(self)
    end

    def to_h
      return Version.to_h(self)
    end

    def to_i
      return Version.to_i(self)
    end

    #Return an array with each number of the version
    def self.to_a(version)
      raise ArgumentError unless version.is_a? Version
      return version.v.dup
    end
    
    #Return an string with each number of the version, joined by '.'
    def self.to_s(version)
      raise ArgumentError unless version.is_a? Version
      return version.v.join('.')
    end

    #Not work
    def self.to_h(version)
      raise ArgumentError unless version.is_a? Version
      return nil
    end
    
    #Return an integer with each number of the version
    def self.to_i(version)
      raise ArgumentError unless version.is_a? Version
      i = 0
      version.v.each{|e| i = i * 10 + e}
      return i
    end
  end

end
