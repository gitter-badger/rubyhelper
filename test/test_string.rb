#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class StringHelperTest < Minitest::Test

  def test_to_plain
    assert_equal("bonjour", "bonjour".to_plain)
    assert_equal("bonjoure", "bonjouré".to_plain, "bonjoure")
    assert_equal("bonjo\\AAAur", "bonjo\\AAAur".to_plain)
    assert_equal("bonjo", "bonjo€".to_plain)
  end

  def test_p
    assert_equal("bonjour", "bonjour".p)
    assert_equal("bonjoure", "bonjouré".p)
    assert_equal("bonjo\\AAAur", "bonjo\\AAAur".p)
    assert_equal("bonjo€", "bonjo€".p)
  end

  def test_to_case_downcase
    assert_equal("bonjour", "bonJoUr".to_case(:downcase))
    assert_equal("bonjour toi", "bonJoUr tOI".to_case(:downcase))
  end

  def test_to_case_upcase
    assert_equal("BONJOUR", "bonJoUr".to_case(:upcase))
    assert_equal("BONJOUR TOI", "bonJoUr tOI".to_case(:upcase))
  end

  def test_to_case_capitalize
    assert_equal("Bonjour", "bonJoUr".to_case(:capitalize))
    assert_equal("Bonjour Toi", "bonJoUr tOI".to_case(:capitalize))
  end

  def test_to_case_classic
    assert_equal("Bonjour", "bonJoUr".to_case(:classic))
    assert_equal("Bonjour toi", "bonJoUr tOI".to_case(:classic))
  end

  def test_to_ascii
    assert_equal("bonjoure", "bonjoure".to_ascii(""))
    assert_equal("bonjoure", "bonjouré".to_ascii(""))
    assert_equal("bonjoure", "bonjouré".to_ascii("."))
    assert_equal("bonjour", "bonjour€".to_ascii(""))
    assert_equal("bonjour.", "bonjour€".to_ascii("."))
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

  def test_to_t
    assert_equal(true, "true".to_t)
    assert_equal(false, "false".to_t)
    assert_equal(nil, "truex".to_t)
    assert_equal(nil, "xfalsex".to_t)
    assert_equal(nil, "".to_t)
  end

  def test_true?
    assert_equal(true, "true".true?)
    assert_equal(false, "false".true?)
    assert_equal(false, "other".true?)
  end

  def test_false?
    assert_equal(false, "true".false?)
    assert_equal(true, "false".false?)
    assert_equal(false, "other".false?)
  end

  def test_scapitalize
    assert_equal("Bonjour Monsieur", "Bonjour Monsieur".scapitalize)
    assert_equal("Bonjour M A D & A", "BONJOUR M A D & A".scapitalize)
    assert_equal("1 And 1 Sontdesvoleurs", "1 and 1 sontdesvoleurs".scapitalize)
  end

  def test_splity
    assert_equal(["bonjour", "à", "toi"], "bonjour\nà\ntoi".splity)
    assert_equal(["bonjour", "à", "toi"], "\nbonjour\n\nà\n\ntoi\n\n\r".splity)
    assert_equal(["bonjour", "à", "toi"], "\nbonjour\n\nà\n\ntoi\n\n\r".splity)
    assert_equal(["bonjour", "à", "toi"], "bonjourXàXtoiX".splity("X"))
    assert_equal(["bonjour", "à", "toi"], "bonjourXàYtoiX".splity(/X|Y/))
  end

end
