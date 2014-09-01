#encoding: utf-8

module VersionHelper

  class Version
    def initialize(*arg)
      @v = Array.new
    end

    def to_a
      return Version.to_a(self)
    end

    def to_s
      return Version.to_s(self)
    end

    def to_h
      return Version.to_s(self)
    end

    def to_i
      return Version.to_s(self)
    end

    def self.to_a(version)
      raise ArgumentError unless version.is_a? Version
    end

    def self.to_s(version)
      raise ArgumentError unless version.is_a? Version
    end

    def self.to_h(version)
      raise ArgumentError unless version.is_a? Version
    end

    def self.to_i(version)
      raise ArgumentError unless version.is_a? Version
    end
  end

end
