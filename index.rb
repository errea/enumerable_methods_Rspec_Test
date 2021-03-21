require_relative 'enumerable'

# my_each test case
a = %w[a b c]
a.my_each { |x| print x, ' -- ' }

# my_each_with_index test case
hash = {}
%w[cat dog wombat].my_each_with_index do |item, index|
  hash[item] = index
end

%w[cat dog wombat].my_each_with_index do |item, index|
  "#{index}_#{item}"
end

# my_select test case
(1..10).my_select { |i| (i % 3).zero? } #=> [3, 6, 9]
[1, 2, 3, 4, 5].my_select(&:even?) #=> [2, 4]
[1, 2, 3, 4, 5].my_select { |num| num > 3 } #=> [4, 5]
%i[foo bar].my_select { |x| x == :foo }

# all?
%w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_all?(/t/) #=> false
[1, 2i, 3.14].my_all?(Numeric) #=> true
[nil, true, 99].my_all? #=> false
[].my_all? #=> true

# any?
%w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].my_any?(/d/) #=> false
[nil, true, 99].my_any?(Integer) #=> true
[nil, true, 99].my_any? #=> true
[].my_any? #=> false

# my_none?
%w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
%w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_none?(/d/) #=> true
[1, 3.14, 42].my_none?(Float) #=> false
[].my_none? #=> true
[nil].my_none? #=> true
[nil, false].my_none? #=> true
[nil, false, true].my_none? #=> false

# my_count
ary = [1, 2, 4, 2]
ary.my_count #=> 4
ary.my_count(2) #=> 2
ary.my_count(&:even?) #=> 3

# my_map
a = %w[a b c d]
a.my_map.with_index { |x, i| x * i } #=> ["", "b", "cc", "ddd"]
(1..4).my_map { |i| i * i } #=> [1, 4, 9, 16]
(1..4).my_map { 'cat' } #=> ["cat", "cat", "cat", "cat"]
my_proc = proc { |i| i * i }
(1..5).my_map(my_proc) { |i| i + i }

# my_inject

# Sum some numbers
(5..10).my_inject(:+) #=> 45
# Same using a block and inject
(5..10).my_inject { |sum, n| sum + n } #=> 45
# Multiply some numbers
(5..10).my_inject(1, :*) #=> 151200

p multiply_els([1, 2, 3])
