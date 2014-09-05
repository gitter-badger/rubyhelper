#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class StringHelperTest < Minitest::Test

  def test_to_plain
    assert_equal("bonjour".to_plain, "bonjour")
    assert_equal("bonjouré".to_plain, "bonjoure")
    assert_equal("bonjo\\AAAur".to_plain, "bonjo\\AAAur")
    assert_equal("bonjo€".to_plain, "bonjo")
  end

  def test_p
    assert_equal("bonjour".p, "bonjour")
    assert_equal("bonjouré".p, "bonjoure")
    assert_equal("bonjo\\AAAur".p, "bonjo\\AAAur")
    assert_equal("bonjo€".p, "bonjo€")
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

  def test_to_ii
    assert_equal("1 1".to_ii(), 11)
    assert_equal("06.08.68".to_ii("."), 60868)
    assert_equal("06.08.68".to_ii("\. \t\-"), 60868)
  end

  def test_to_t
    assert_equal("true".to_t, true)
    assert_equal("false".to_t, false)
    assert_equal("truex".to_t, nil)
    assert_equal("xfalsex".to_t, nil)
    assert_equal("".to_t, nil)
  end

  def test_static
    assert_equal("r", "bonjour".static(1, " "))
    assert_equal("our", "bonjour".static(3, " "))
    assert_equal("bonjour   ", "bonjour".static(10, " "))
    assert_equal("b", "bonjour".static(1, " ", :front))
    assert_equal("bon", "bonjour".static(3, " ", :front))
    assert_equal("   bonjour", "bonjour".static(10, " ", :front))
    assert_equal("j", "bonjour".static(1, " ", :center))
    assert_equal("jo", "bonjour".static(2, " ", :center))
    assert_equal("njo", "bonjour".static(3, " ", :center))
    assert_equal("njou", "bonjour".static(4, " ", :center))
    assert_equal("bonjour ", "bonjour".static(8, " ", :center))
    assert_equal(" bonjour ", "bonjour".static(9, " ", :center))
    assert_equal(" bonjour  ", "bonjour".static(10, " ", :center))
    assert_equal("  bonjour  ", "bonjour".static(11, " ", :center))
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

  def test_scapitalize
    assert_equal("Bonjour Monsieur", "Bonjour Monsieur".scapitalize)
    assert_equal("Bonjour M A D & A", "BONJOUR M A D & A".scapitalize)
    assert_equal("1 And 1 Sontdesvoleurs", "1 and 1 sontdesvoleurs".scapitalize)
  end

end
