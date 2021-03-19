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

  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    to_a.length.times { |i| arr.push(to_a[i]) if yield to_a[i] }
    arr
  end

  # my_all?

  def my_all?(param = true)
    bool = true
    if block_given?
      to_a.length.times { |i| bool &&= false unless yield to_a[i] }
    elsif [true, false].include?(param)
      to_a.length.times { |i| bool &&= false unless to_a[i] }
    elsif !param.instance_of?(Class)
      to_a.length.times { |i| bool &&= false unless to_a[i] == param }
    else
      to_a.length.times { |i| bool &&= false unless to_a[i].is_a?(param) }
    end
    bool
  end

  # my_any?

  def my_any?(param = false)
    bool = false
    if block_given?
      to_a.length.times { |i| bool ||= true if yield to_a[i] }
    elsif [true, false].include?(param)
      to_a.length.times { |i| bool ||= true if to_a[i] }
    elsif !param.instance_of?(Class)
      to_a.length.times { |i| bool ||= true if to_a[i] == param }
    else
      to_a.length.times { |i| bool ||= true if to_a[i].is_a?(param) }
    end
    bool
  end

  # my_none?

  def my_none?(param = true)
    bool = true
    if block_given?
      to_a.length.times { |i| bool &&= false if yield to_a[i] }
    elsif [true, false].include?(param)
      to_a.length.times { |i| bool &&= false if to_a[i] }
    elsif !param.instance_of?(Class)
      to_a.length.times { |i| bool &&= false if to_a[i] == param }
    else
      to_a.length.times { |i| bool &&= false if to_a[i].is_a?(param) }
    end
    bool
  end

  # my_count?

  def my_count?(param = nil)
    arr = []
    if block_given?
      to_a.length.times { |i| arr.push(to_a[i]) if yield to_a[i] }
      arr.length
    elsif !param.nil? || to_a.my_any?.nil?
      to_a.length.times { |i| arr.push(to_a[i]) if to_a[i] == param }
      arr.length
    else
      to_a.length
    end
  end

  # my_map

  def my_map
    return to_enum(:my_map) unless block_given?

    arr = []
    to_a.length.times { |i| arr.push(yield to_a[i]) }
    arr
  end

  # my_inject

end
