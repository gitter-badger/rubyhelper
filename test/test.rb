#!/usr/bin/env ruby
#encoding: utf-8

require_relative "../lib/rubyhelper.rb"

puts [1,2,3,4,5].to_clean_s([2,4,6])
str = ("ZZZZaZZZZZ" ^ "aaaaaaaaaa")
puts str
puts str.size
puts ("Z" ^ "a") * str.size
puts str.sha2
puts str.sha2.static(4)
puts str.sha2.static(8)
puts str.sha2.static(16)
puts str.sha2.static(32)
puts str.sha2.static(64)
puts str.sha2.static(128)
