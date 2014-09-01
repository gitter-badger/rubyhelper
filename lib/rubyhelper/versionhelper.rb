#encoding: utf-8

require 'pry'

module VersionHelper

  class Version

    attr_accessor :v

    def initialize(*arg)
      @v = []
      if arg.size == 1
        v = arg.first
        case v.class.to_s
        when 'String'
          v.gsub!(/\D/, '.')
          v.gsub!(/\A\D/, '')
          @v = v.split('.').map{|e| e.to_i}
        when 'Array'
          @v = v.map{|e| e.to_i}
        when 'Fixnum'
          @v << v.to_i
        else
          raise ArgumentError, v.class.to_s
        end
      end
      if arg.size > 1
        @v = arg.map{|e| e.to_i}
      end
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

    def self.to_a(version)
      raise ArgumentError unless version.is_a? Version
      return version.v.dup
    end

    def self.to_s(version)
      raise ArgumentError unless version.is_a? Version
      return version.v.join('.')
    end

    #Not work
    def self.to_h(version)
      raise ArgumentError unless version.is_a? Version
      return nil
    end

    def self.to_i(version)
      raise ArgumentError unless version.is_a? Version
      i = 0
      version.v.each{|e| i = i * 10 + e}
      return i
    end
  end

end
