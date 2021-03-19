require_relative 'enumerable'

# my_each test case
a = %w[a b c]
a.my_each { |x| print x, ' -- ' }

# my_each_with_index test case
hash = {}
%w[cat dog wombat].my_each_with_index do |item, index|
  hash[item] = index
end
hash

%w[cat dog wombat].my_each_with_index do |item, index|
"#{index}_#{item}"
end

# my_select test case
(1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]
[1,2,3,4,5].my_select { |num|  num.even?  }   #=> [2, 4]
[1,2,3,4,5].my_select { |num|  num > 3  }   #=> [4, 5]
[:foo, :bar].my_select { |x| x == :foo }

# all?
 %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
 %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
 %w[ant bear cat].my_all?(/t/)                        #=> false
 [1, 2i, 3.14].my_all?(Numeric)                       #=> true
 [nil, true, 99].my_all?                              #=> false
 [].my_all?                                           #=> true

# any?
%w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].my_any?(/d/)                        #=> false
[nil, true, 99].my_any?(Integer)                     #=> true
[nil, true, 99].my_any?                              #=> true
[].my_any?                                           #=> false

# my_none?
%w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
%w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
%w{ant bear cat}.my_none?(/d/)                        #=> true
[1, 3.14, 42].my_none?(Float)                         #=> false
[].my_none?                                           #=> true
[nil].my_none?                                        #=> true
[nil, false].my_none?                                 #=> true
[nil, false, true].my_none?                           #=> false

#my_count?

ary = [1, 2, 4, 2]
p ary.my_count?               #=> 4
p ary.my_count?(2)            #=> 2
p ary.my_count?{ |x| x%2==0 } #=> 3