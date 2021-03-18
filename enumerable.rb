module Enumerable
  # my_each method
  def my_each
    return to_enum(:my_each) unless block_given?

    to_a.length.times { |i| yield to_a[i] }
    self
  end

  # each_with_index
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    to_a.length.times { |i| yield to_a[i], i }
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    
    to_a.length.times { |i| yield(to_a[i]).positive? }
    self
  end
end
