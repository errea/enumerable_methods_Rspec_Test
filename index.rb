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

p [1,2,3,4,5].my_select { |num|  num.even?  }   #=> [2, 4]
p [1,2,3,4,5].my_select { |num|  num > 3  }   #=> [4, 5]
