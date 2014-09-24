#encoding: utf-8

require 'benchmark'

N_B = 100000

Benchmark.bm do |x|
  x.report('action1') { N_B.times do
    end }

  x.report('action2') { N_B.times do
    end }
end
