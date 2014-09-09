#encoding: utf-8

class ArgumentError

  def self.force_type(var, type, name='argument')
    raise ArgumentError, "#{name} must be a #{type}" unless var.is_a? type
  end

end
