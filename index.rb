require_relative 'enumerable'

# my_each test case
a = %w[a b c]
a.my_each { |x| print x, ' -- ' }
