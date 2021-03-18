module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    to_a.length.times { |i| yield to_a[i] }
    self
  end
end
