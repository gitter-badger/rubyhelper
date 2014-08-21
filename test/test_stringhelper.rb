#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class StringHelperTest < Minitest::Test

  def test_to_plain
    assert_equal("bonjour".to_plain, "bonjour")
    assert_equal("bonjouré".to_plain, "bonjoure")
    assert_equal("bonjo\\AAAur".to_plain, "bonjo\\AAAur")
  end

  def test_to_case
    assert_equal("bonjour".to_case(:downcase), "bonjour")
    assert_equal("bonJour".to_case(:upcase), "BONJOUR")
    assert_equal("bonJour".to_case(:capitalize), "Bonjour")
  end

  def test_static
    assert_equal("bonjour".static(1, " "), "b")
    assert_equal("bonjour".static(10, " "), "bonjour   ")
  end

  def test_get_int
    assert_equal("ea ze 13e12 à nnazdaz d".get_int(), "1312")
    assert_equal("ea\n ze 13\n12\n à nnazdaz\n\t\n\r d".get_int(), "1312")
  end
end
