module HashHelper

  # Return a hash that includes everything but the given keys.
  #
  # @return [Hash]
  def except(*keys)
    return self.dup.except!(*keys)
  end

  # Replaces the hash without the given keys.
  #
  # @return [Hash]
  def except!(*keys)
    keys.each { |key| self.delete(key) }
    return self
  end

end

class Hash
  prepend HashHelper
end
