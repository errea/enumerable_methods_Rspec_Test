module Enumerable
  # my_each method
  def my_each
    return to_enum(:my_each) unless block_given?

    to_a.length.times { |i| yield to_a[i] }
    self
  end

  # each_with_index method
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    to_a.length.times { |i| yield to_a[i], i }
    self
  end

  #select method
 # def my_select
   # return to_enum(:my_select) unless block_given?
    
    #to_a.my_even { |i| yield(to_a[i]).positive? }
    #self
  #end
#end

#All method
def my_all?(array = true)
  statement = true
  my_each do |index|
    if block_given?
      statement = false unless yield(index)
    elsif array.nil?
      statement = false unless index
    else
      statement = false unless array === index
    end
  end
  statement
end

#Any method
def my_all?(array = nil)
  statement = false
  my_each do |index|
    if block_given?
      statement = true if yield(index)
    elsif array.nil?
      statement = true if index
    elsif array  === index
      statement = true
    end
  end
  statement
end


#None Method
def my_none?(array = nil)
  statement = true
  my_each do |index|
    if block_given?
      statement = false if yield index
    elsif array.nil?
      statement = false if index
    elsif array === index
      my_each { |_index| statement = false }
    end
  end
  statement
end


end
