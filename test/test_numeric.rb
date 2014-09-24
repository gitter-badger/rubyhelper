#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class NumericHelperTest < Minitest::Test

  def test_sign
    assert_equal("-", -1.sign("+", "-"))
    assert_equal("+", 0.sign("+", "-"))
    assert_equal("+", 1.sign("+", "-"))
  end

  def test_min
    assert_equal(2, 1.min(2))
    assert_equal(1, 1.min(1))
    assert_equal(1, 1.min(0))
    assert_equal(0, (-1).min(0))
    assert_equal(1, 0.min(1))
    assert_equal(1.1, 1.min(1.1))
  end

  def test_max
    assert_equal(1, 1.max(2))
    assert_equal(1, 1.max(1))
    assert_equal(0, 1.max(0))
    assert_equal(-1, (-1).max(0))
    assert_equal(0, 0.max(1))
    assert_equal(1, (2.2).max(1))
    assert_equal(20, 100.max(20))
  end

  def test_odd?
    assert_equal(false, 0.0.odd?)
    assert_equal(true, 1.1.odd?)
    assert_equal(false, 2.0.odd?)
    assert_equal(true, 3.0.odd?)
  end

  def test_peer?
    assert_equal(true, 0.0.peer?)
    assert_equal(false, 1.1.peer?)
    assert_equal(true, 2.0.peer?)
    assert_equal(false, 3.0.peer?)
  end

  def test_solve_2d
    #assert_equal([0], Numeric.solve_2d(1,0,0))
  end

end
