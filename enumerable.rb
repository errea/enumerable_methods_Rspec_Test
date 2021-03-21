# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

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

  def my_all?(param = nil)
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

  def my_any?(param = nil)
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

  def my_none?(param = nil)
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

  def my_map(outer_proc = nil)
    return to_enum(:my_map, outer_proc) unless block_given? || !outer_proc.nil?

    arr = []
    if outer_proc.respond_to? :call
      to_a.length.times { |i| arr.push(outer_proc.call(to_a[i])) }
    else
      to_a.length.times { |i| arr.push(yield to_a[i]) }
    end
    arr
  end

  # my_inject

  def my_inject(initial = nil, sym = nil)
    result = initial
    if initial.nil?
      result = to_a[0]
      to_a[1..-1].my_each { |index| result = yield(result, index) }
    elsif block_given?
      to_a.my_each { |index| result = yield(result, index) }
    elsif initial && sym
      to_a.my_each { |index| result = result.send(sym, index) }
    elsif initial.is_a? Integer
      to_a.my_each { |index| result += index }
    else
      result = to_a[0]
      to_a[1..-1].my_each { |index| result = result.send(initial, index) }
    end
    result
  end

  # rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
end

def multiply_els(arr)
  arr.my_inject(1, :*)
end
