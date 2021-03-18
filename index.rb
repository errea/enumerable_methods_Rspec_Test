require_relative 'enumerable'

# my_each test case
a = %w[a b c]
a.my_each { |x| print x, ' -- ' }

#my_each_with_index test case
hash = Hash.new
%w(cat dog wombat).each_with_index { |item, index|
  hash[item] = index
}
p hash   

%w(cat dog wombat).my_each_with_index { |item, index|
  p  index.to_s + "_" + item
  }