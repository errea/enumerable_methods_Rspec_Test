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
#p [1,2,3,4,5].my_select { |num|  num.even?  }   #=> [2, 4]
#p [1,2,3,4,5].my_select { |num|  num > 3  }   #=> [4, 5]

#my_all test case
p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_all?(/t/)                        #=> false
p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
p [nil, true, 99].my_all?                              #=> false
p [].my_all?                                           #=> true                         



#my_any test case
=begin %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].my_any?(/d/)                        #=> false
[nil, true, 99].my_any?(Integer)                     #=> true
[nil, true, 99].my_any?                              #=> true
[].my_any?                                           #=> false
 =end