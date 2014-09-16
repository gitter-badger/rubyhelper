#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class StringNumericHelperTest < Minitest::Test

  def test_to_fi
    assert_equal(0.0, "bonjour".to_fi)
    assert_equal(0.0, "bonj1our".to_fi)
    assert_equal(1.1, "1.1.1".to_fi)
    assert_equal(1.1, "1.1".to_fi)
    assert_equal(1.1, "1,1".to_fi)
    assert_equal(0.1, ",1,1".to_fi)
  end

  def test_to_ii
    assert_equal(11, "1 1".to_ii())
    assert_equal(60868, "06.08.68".to_ii("."))
    assert_equal(60868, "06.08.68".to_ii("\. \t\-"))
  end

  def test_get_int
    assert_equal("1312", "1312".get_int())
    assert_equal("-1312", "ea -ze 13e12 à nnazdaz d".get_int())
    assert_equal("+1312", "ea\n ze +13\n12\n à nnazdaz\n\t\n\r d".get_int())
    assert_equal("1312", "ea\n ze -13\n12\n à nnazdaz\n\t\n\r d".get_int(false))
    assert_equal("-1312", "ea\n ze -13\n12\n à nnazdaz\n\t\n\r d".get_int(:less))
    assert_equal("1312", "ea\n ze +13\n12\n à nnazdaz\n\t\n\r d".get_int(false))
  end

  def test_get_1int
    assert_equal("1312", "1312".get_1int())
    assert_equal("-13", "ea -ze -13e12 à nnazdaz d".get_1int())
    assert_equal("13", "13ea -ze -13e12 à nnazdaz d".get_1int())
    assert_equal("13", "ea -ze -13e12 à nnazdaz d".get_1int(false))
    assert_equal("-13", "ea -ze -13e12 à nnazdaz d".get_1int(:less))
    assert_equal("13", "ea -ze 13-13e12 à nnazdaz d".get_1int(false))
    assert_equal("1312", "13 12.01".get_1int(true, ' '))
  end

  def test_get_1int_raise
    assert_raises ArgumentError do
      assert_equal("1312", "13 12.01".get_1int(true, 124))
    end
  end

  def test_get_ints
    assert_equal(["1", "-3", "+12"], "1 -3 +12".get_ints())
    assert_equal(["1", "-3", "+12"], "a1;aaa -3eze +1ez2ez".get_ints())
    assert_equal(["1", "3+12"], "1 -3 +12".get_ints('-'))
  end

  def test_get_1ints
    assert_equal(["1", "-3", "+12"], "1 -3 +12".get_1ints())
    assert_equal(["1", "-3", "+1"], "a1;aaa -3eze +1ez2ez".get_1ints())
    assert_equal(["1", "3"], "1 -3 +12".get_1ints('-'))
    assert_equal(["11", "33"], "1 1\t3 3".get_1ints("\t", true, " "))
  end

  def test_get_float
    assert_equal("13,12", "13,12".get_float())
    assert_equal("-13.12", "ea -ze 13e.12 à nnazdaz d".get_float())
    assert_equal("+13.12", "ea\n ze +13\n.12\n à nnazdaz\n\t\n\r d".get_float())
    assert_equal("-13.12", "ea\n ze -13\n.12\n à nnazdaz\n\t\n\r d".get_float())
    assert_equal("--13.12", "ea\n ze- -13\n.12\n à nnazdaz\n\t\n\r d".get_float())
    assert_equal("13.12", "ea\n ze- -13\n.12\n à nnazdaz\n\t\n\r d".get_float(false))
    assert_equal("--13.12", "ea\n ze- -13\n.12\n à nnazdaz\n\t\n\r d".get_float(:less))
  end

  def test_get_1float
    assert_equal("1312.1", "1312.1".get_1float())
    assert_equal("-13,2", "ea -ze -13,2e12,2 à nnazdaz d".get_1float())
    assert_equal("13,12", "13,12ea -ze -13,12e12,13 à nnazdaz d".get_1float())
    assert_equal("13.0", "ea -ze -13.0e12 à nnazdaz d".get_1float(false))
    assert_equal("13.", "ea -ze 13.-13.1e12.2 à nnazdaz d".get_1float(false))
    assert_equal("-13.1", "ea -ze -13.1e12.2 à nnazdaz d".get_1float(:less))
  end

  def test_get_floats
    assert_equal(["1", "-3", "+12"], "1 -3 +12".get_floats())
    assert_equal(["1", "-3.1", "+12"], "a1;aaa -3.1eze +1ez2ez".get_floats())
    assert_equal(["1", "3+12,2"], "1 -3 +12,2".get_floats('-'))
  end

  def test_get_1floats
    assert_equal(["1", "-3", "+12"], "1 -3 +12".get_1floats())
    assert_equal(["1", "-3.1", "+1"], "a1;aaa -3.1eze +1ez2ez".get_1floats())
    assert_equal(["1", "3,1"], "1 -3,1 +12,2".get_1floats('-'))
  end

  def test_ha2m2
    #simple match
    assert_equal(10_000.0, "1 ha".ha2m2)
    assert_equal(10_000.0, "1 Ha".ha2m2)
    assert_equal(10_000.0, "ha 1".ha2m2)
    assert_equal(10_000.0, "1ha".ha2m2)

    #advanced match
    assert_equal(12000, "1.2 Ha".ha2m2)
    assert_equal(12000, " 1,200 Ha".ha2m2)
    assert_equal(10000.0, "1 ha (+ 10 m²)".ha2m2)
    assert_equal(10000.0, "1 ha (+ 10 m2)".ha2m2)

    #not match
    assert_equal(1.0, "1 m2".ha2m2)
    assert_equal(1.0, "1 h a".ha2m2)

    #not match advanced
    assert_equal(1.0, "1 m2 (+ 1 ha)".ha2m2)
    assert_equal(50.0, "50.0 m² without the 1 ha of eastead".ha2m2)
  end

end
