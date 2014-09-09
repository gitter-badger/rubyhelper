#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class HashHelperTest < Minitest::Test

  def test_except
    assert_equal({ :data => :a, :datb => :b },
                 {
                   :datx => :x,
                   :data => :a,
                   :datb => :b,
                   :datc => :c,
                 }.except!(:datx, :datc))
  end

end
