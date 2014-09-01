require 'minitest/autorun'
require 'rubyhelper'

class VersionHelperTest < Minitest::Test

  def test_new
    v1 = VersionHelper::Version.new 1
    v2 = VersionHelper::Version.new [1,2]
    v3 = VersionHelper::Version.new "v1,2.3"
    v4 = VersionHelper::Version.new 123
  end

  def test_incr!
    v1 = VersionHelper::Version.new 1
    v2 = VersionHelper::Version.new 1,2
    v3 = VersionHelper::Version.new 1,2,3
    v1.incr!
    v2.incr!
    v3.incr!
  end

  def test_decr!
    v1 = VersionHelper::Version.new 1
    v2 = VersionHelper::Version.new 1,2
    v3 = VersionHelper::Version.new 1,2,3
    v1.decr!
    v2.decr!
    v3.decr!
  end

  def test_to_i
    v1 = VersionHelper::Version.new 1
    v2 = VersionHelper::Version.new 1,2
    v3 = VersionHelper::Version.new 1,2,3
    assert_equal(1, v1.to_i)
    assert_equal(12, v2.to_i)
    assert_equal(123, v3.to_i)
  end

  def test_to_s
    v1 = VersionHelper::Version.new 1
    v2 = VersionHelper::Version.new 1,2
    v3 = VersionHelper::Version.new 1,2,3
    assert_equal("1", v1.to_s)
    assert_equal("1.2", v2.to_s)
    assert_equal("1.2.3", v3.to_s)
  end

  def test_to_a
    v1 = VersionHelper::Version.new 1
    v2 = VersionHelper::Version.new 1,2
    v3 = VersionHelper::Version.new 1,2,3
    assert_equal([1], v1.to_a)
    assert_equal([1,2], v2.to_a)
    assert_equal([1,2,3], v3.to_a)
  end

end
