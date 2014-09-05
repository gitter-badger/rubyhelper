#encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/rubyhelper'

class ArrayHelperTest < Minitest::Test

  def test_joini
    assert_equal({ :data => :a, :datb => :b },
                 {
                   :datx => :x,
                   :data => :a,
                   :datb => :b,
                   :datc => :c,
                 }.except!(:datx, :datc))
  end

end
