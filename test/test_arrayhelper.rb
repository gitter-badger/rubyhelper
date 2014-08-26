#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class ArrayHelperTest < Minitest::Test

  def test_joini
    assert_equal("s,S.s", ["s","S","s"].joini([",", "."]))
    assert_equal("s,S.s.S", ["s","S","s","S"].joini([",", ".", "."]))
  end

  def test_sum
    assert_equal(12, [1,2,9].sum)
    assert_equal(0, [].sum)
  end

  def test_sumf
    assert_equal(12.0, [1,2, 9].sumf)
    assert_equal(0.1, [0.01, 0.09, -0, -1, 1.1, -0.1].sumf.round(2))
    assert_equal(0.0, [].sumf)
  end

  def test_average
    assert_equal(2, [1,2,3].average)
  end

  def test_averagef
    assert_equal(2.5, [2,3].averagef)
  end

  def test_maxs
    assert_equal([44], [2,3,1,14,44,-1,1,2].maxs(0))
    assert_equal([44], [2,3,1,14,44,-1,1,2].maxs(1))
    assert_equal([14,44], [2,3,1,14,44,-1,1,2].maxs(2))
    assert_equal([-1,1,1,2,2,3,14,44], [2,3,1,14,44,-1,1,2].maxs(100))
  end

  def test_compacti
    assert_equal([" "], ["", " ", nil].compacti)
  end

end
