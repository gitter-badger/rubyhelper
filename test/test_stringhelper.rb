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

  def test_to_case
    assert_equal("bonjour".to_case(:downcase), "bonjour")
    assert_equal("bonJour".to_case(:upcase), "BONJOUR")
    assert_equal("bonJour".to_case(:capitalize), "Bonjour")
  end

  def test_to_ascii
    assert_equal("bonjoure".to_ascii(""), "bonjoure")
    assert_equal("bonjouré".to_ascii(""), "bonjoure")
    assert_equal("bonjouré".to_ascii("."), "bonjoure")
    assert_equal("bonjour€".to_ascii(""), "bonjour")
    assert_equal("bonjour€".to_ascii("."), "bonjour.")
  end

  def test_to_f
    assert_equal("bonjour".to_f, 0.0)
    assert_equal("bonj1our".to_f, 0.0)
    assert_equal("1.1.1".to_f, 1.1)
    assert_equal("1.1".to_f, 1.1)
    assert_equal("1,1".to_f, 1.1)
    assert_equal(",1,1".to_f, 0.1)
  end

  def test_to_i_wd
    assert_equal("1 1".to_i_wd(), 11)
    assert_equal("06.08.68".to_i_wd("."), 60868)
    assert_equal("06.08.68".to_i_wd("\. \t\-"), 60868)
  end

  def test_to_t
    assert_equal("true".to_t, true)
    assert_equal("false".to_t, false)
    assert_equal("truex".to_t, nil)
    assert_equal("xfalsex".to_t, nil)
    assert_equal("".to_t, nil)
  end

  def test_static
    assert_equal("bonjour".static(1, " "), "b")
    assert_equal("bonjour".static(10, " "), "bonjour   ")
  end

  def test_get_int
    assert_equal("1312".get_int(), "1312")
    assert_equal("ea -ze 13e12 à nnazdaz d".get_int(), "-1312")
    assert_equal("ea\n ze +13\n12\n à nnazdaz\n\t\n\r d".get_int(), "+1312")
  end

  def test_get_int
    assert_equal("13,12".get_float(), "13,12")
    assert_equal("ea -ze 13e.12 à nnazdaz d".get_float(), "-13.12")
    assert_equal("ea\n ze +13\n.12\n à nnazdaz\n\t\n\r d".get_float(), "+13.12")
  end

  def test_nil!
    a = "" ; a.nil!
    b = " " ; b.nil!
    c = "test" ; c.nil!
    assert_equal(nil, a)
    assert_equal("test", b)
    assert_equal(" ", c)
  end

end
