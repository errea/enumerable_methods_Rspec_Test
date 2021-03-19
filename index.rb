require_relative 'enumerable'

# my_each test case
a = %w[a b c]
a.my_each { |x| print x, ' -- ' }

# my_each_with_index test case
hash = {}
%w[cat dog wombat].my_each_with_index do |item, index|
  hash[item] = index
end
p hash

%w[cat dog wombat].my_each_with_index do |item, index|
  p "#{index}_#{item}"
end

# my_select test case
p (1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]
p [1,2,3,4,5].my_select { |num|  num.even?  }   #=> [2, 4]
p [1,2,3,4,5].my_select { |num|  num > 3  }   #=> [4, 5]
p [:foo, :bar].my_select { |x| x == :foo }

# all?
 %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
 %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
 %w[ant bear cat].my_all?(/t/)                        #=> false
 [1, 2i, 3.14].my_all?(Numeric)                       #=> true
 [nil, true, 99].my_all?                              #=> false
 [].my_all?                                           #=> true

# any?
p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/)                        #=> false
p [nil, true, 99].my_any?(Integer)                     #=> true
p [nil, true, 99].my_any?                              #=> true
p [].my_any?                                           #=> false

# none?
%w{ant bear cat}.none? { |word| word.length == 5 } #=> true
%w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
%w{ant bear cat}.none?(/d/)                        #=> true
[1, 3.14, 42].none?(Float)                         #=> false
[].none?                                           #=> true
[nil].none?                                        #=> true
[nil, false].none?                                 #=> true
[nil, false, true].none?                           #=> false