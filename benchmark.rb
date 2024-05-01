require 'benchmark'

STRING_HASH = {'aaa'=> 'xxx'}
SYMBOL_HASH = {:aaa => 'xxx'}
NUMBER_HASH = {100  => 'xxx'}
str,sym,num = 'aaa', :aaa, 100

n = 50000
Benchmark.bm(7, ">total:", ">avg:") do |x|
  tf = x.report("String") { n.times {STRING_HASH[str]}}
  tt = x.report("Symbol") { n.times {SYMBOL_HASH[sym]}}
  tu = x.report("Number") { n.times {NUMBER_HASH[num]}}
  [tf + tt + tu, (tf + tt + tu) / 3]
end