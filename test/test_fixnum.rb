#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class FixnumHelperTest < Minitest::Test

  def test_peer?
    assert_equal(true, 0.peer?)
    assert_equal(false, 1.peer?)
    assert_equal(true, 2.peer?)
    assert_equal(false, 3.peer?)
  end

  def test_plus()
    assert_equal("1test", 1 + "test")
    assert_equal("0test", 0 + 0 + "test")
    assert_equal("125test", 124 + 1 + "test")
    20.times do
      i, j = rand(0..4294967295), rand(0..4294967295)
      assert_equal(i + j, j + i)
    end
  end

end
