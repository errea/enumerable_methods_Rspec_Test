require_relative 'enumerable'

# my_each test case
a = %w[a b c]
a.my_each { |x| print x, ' -- ' }

# my_each_with_index test case
hash = {}
%w[cat dog wombat].each_with_index do |item, index|
  hash[item] = index
end
p hash

%w[cat dog wombat].my_each_with_index do |item, index|
  p "#{index}_#{item}"
end
