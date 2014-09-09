#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class ArrayHelperTest < Minitest::Test

  def test_joini
    assert_equal("s,S.s", ["s","S","s"].joini([",", "."]))
    assert_equal("s,S.s.S", ["s","S","s","S"].joini([",", ".", "."]))
    assert_equal("s.S.s.S", ["s","S","s","S"].joini("."))
  end

  def test_joini_error
    assert_raises ArgumentError do
      [].joini 1
    end
  end

  def test_sum
    assert_equal(12, [1,2,9].sum)
    assert_equal(0, [].sum)
    assert_equal(0, [-1,1].sum)
  end

  def test_sum_with_array
    assert_equal([2,3,4], [1,2,3].sum([1,1,1]))
    assert_equal([2,3,3], [1,2,3].sum([1,1]))
    assert_equal([2,3], [1,2].sum([1,1,1]))
    assert_equal([], [].sum([1,1,1]))
    assert_equal([1,1,1,3,1,5], [1,1,2,2,3,3].sum([0, 0,-1,+1,-2,+2]))
  end

  def test_sumf
    assert_equal(12.0, [1,2, 9].sumf)
    assert_equal(0.1, [0.01, 0.09, -0, -1, 1.1, -0.1].sumf.round(2))
    assert_equal(0.0, [].sumf)
  end

  def test_sumf_with_array
    assert_equal([2.0,3.0], [1,2].sumf([1,1,1]))
    assert_equal([], [].sumf([1,1,1]))
  end

  def test_average
    assert_equal(2, [1,2,3].average)
    assert_equal(1, [1,1,1].average)
    assert_equal(2, [1,2,2].average)
  end

  def test_averagef
    assert_equal(2.5, [2,3].averagef)
  end

  def test_maxs
    assert_equal([44], [2,3,1,14,44,-1,1,2].maxs(1))
    assert_equal([14,44], [2,3,1,14,44,-1,1,2].maxs(2))
    assert_equal([-1,1,1,2,2,3,14,44], [2,3,1,14,44,-1,1,2].maxs(100))
  end

  def test_compacti
    assert_equal([" "], ["", " ", nil].compacti)
  end

  # + maths : ok
  def test_mirror
   assert_equal([[:a, 1], [:b, 2], [:c, 3]], [:a, :b, :c, 1, 2, 3].mirror)
   assert_equal([[:a, 1], [:b, 2], [:c, 3], [:d, nil]], [:a, :b, :c, :d, 1, 2, 3].mirror)
   assert_equal([[:a, 2], [:b, 3], [:c, 4], [1, nil]], [:a, :b, :c, 1, 2, 3, 4].mirror)
  end

end
