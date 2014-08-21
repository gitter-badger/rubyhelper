require 'minitest/autorun'
require 'rubyhelper'

class RubyHelperTest < Minitest::Test
  def test_string_static
    assert_equal("bonjour".static(1, " "), "b")
    assert_equal("bonjour".static(10, " "), "bonjour   ")
  end
end
