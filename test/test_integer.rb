#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class IntegerHelperTest < Minitest::Test

  def test_peer?
    assert_equal(true, 0.peer?)
    assert_equal(false, 1.peer?)
    assert_equal(true, 2.peer?)
    assert_equal(false, 3.peer?)
  end

end
