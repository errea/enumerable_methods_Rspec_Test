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

  def my_all?(arg = true)

    bool = true
    if block_given?
      to_a.length.times { |i| bool = bool && false unless yield to_a[i] }
    elsif arg == true || arg == false
      to_a.length.times { |i| bool = bool && false unless to_a[i] }
    elsif not arg.instance_of?(Class)
      to_a.length.times { |i| bool = bool && false unless to_a[i] == arg }
    else
      to_a.length.times { |i| bool = bool && false unless to_a[i].is_a?(arg) }
    end
    bool
  end

  # my_any?

  def my_any?(arg = false)

    bool = false
    if block_given?
      to_a.length.times { |i| bool = bool || true if yield to_a[i] }
    elsif arg == true || arg == false
      to_a.length.times { |i| bool = bool || true if to_a[i] }
    elsif not arg.instance_of?(Class)
      to_a.length.times { |i| bool = bool || true if to_a[i] == arg }
    else
      to_a.length.times { |i| bool = bool || true if to_a[i].is_a?(arg) }
    end
    bool
  end

  # my_none?

  def my_none?(arg = true)

    bool = true
    if block_given?
      to_a.length.times { |i| bool = bool && false if yield to_a[i] }
    elsif arg == true || arg == false
      to_a.length.times { |i| bool = bool && false if to_a[i] }
    elsif not arg.instance_of?(Class)
      to_a.length.times { |i| bool = bool && false if to_a[i] == arg }
    else
      to_a.length.times { |i| bool = bool && false if to_a[i].is_a?(arg) }
    end
    bool
  end

  # my_count?

  def my_count?(arg = nil)

    arr = []
    if block_given?
      to_a.length.times { |i| arr.push(to_a[i]) if yield to_a[i] }
      arr.length
    elsif arg != nil || to_a.my_any? == nil
      to_a.length.times { |i| arr.push(to_a[i]) if to_a[i] == arg }
      arr.length
    else
      to_a.length
    end
  end
end
