#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class ArrayHelperTest < Minitest::Test

  def test_to_clean_s_with_array
    assert_equal("s,S.s", ["s","S","s"].to_clean_s_with_array([",", "."]))
    assert_equal("s,S.s.S", ["s","S","s","S"].to_clean_s_with_array([",", ".", "."]))
  end

end
