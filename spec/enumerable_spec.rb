require_relative '../enumerable'

describe 'Enumerable' do
  let(:words_array) { %w[first second longestword word] }
  let(:hash) { { name: 'kiranitor', phone: 7_451_251 } }
  let(:number_array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
  let(:empty_array) { [] }
  let(:false_arr) { [false, nil, false] }
  let(:true_arr) { [1, 3, 5, true] }

  describe 'my_each' do
    it 'checking my_each is working with array' do
      expect(words_array.my_each { |word| word }).to eq(words_array)
    end

    it 'checking my_each is working with hash' do
      expect(hash.my_each do |key, value|
        key if value == 'kiranitor'
      end).to eql(hash.each do |key, value|
        key if value == 'kiranitor'
      end)
    end
  end

  describe 'my_each_with_index' do
    it 'cheking my_each_with_index is working with array' do
      expect(number_array.my_each_with_index do |_number, index|
        index + 1
      end).to eql(number_array.each_with_index do |_number, index|
        index + 1
      end)
    end

    it 'cheking my_each_with_index is working with hash' do
      expect(hash.my_each do |hash, index|
        hash if index == 0
      end).to eql(hash.each_with_index do |hash, index|
        hash if index == 0
      end)
    end
  end

  describe 'my_select' do
    it 'cheking my_select is working with a block' do
      expect(number_array.my_select { |i| (i % 3).zero? }).to eql(number_array.select { |i| (i % 3).zero? })
    end

    it 'cheking my_select is working with a proc' do
      expect(number_array.my_select(&:even?)).to eql(number_array.select(&:even?))
    end
  end

  describe 'my_all?' do
    it 'checking my_all? is working with a block' do
      expect(words_array.my_all? { |word| word.length >= 4 }).to be true
    end

    it 'checking my_all? is working with a regex' do
      expect(words_array.my_all?(/k/)).to be false
    end

    it 'checking my_all? is working with a Class' do
      expect(words_array.my_all?(Numeric)).to be false
    end

    it 'checking my_all? is working without block or proc' do
      expect(words_array.my_all?).to be true
    end

    it 'checking my_all? is working with a empty array' do
      expect(empty_array.my_all?).to be true
    end
  end

  describe 'my_any' do
    it 'Checking my_any is working with a block' do
      expect(words_array.my_any? { |word| word.length >= 3 }).to be true
    end

    it 'Checking my_any is working with a regex' do
      expect(words_array.my_any?(/d/)).to be true
    end

    it 'Checking my_any is working with a Class' do
      expect(words_array.my_any?(Integer)).to be false
    end

    it 'Checking my_any is working with a empty array' do
      expect(empty_array.my_any?).to be false
    end
  end

  describe 'my_none' do
    it 'Checking my_none is working with a block' do
      expect(words_array.my_none? { |word| word.length == 5 }).to be false
    end

    it 'Checking my_none is working with a regex' do
      expect(words_array.my_none?(/d/)).to be false
    end

    it 'Checking my_none is working with a Class' do
      expect(words_array.my_none?(Float)).to be true
    end

    it 'Checking my_none is working with a empty array' do
      expect(empty_array.my_none?).to be true
    end

    it 'Checking my_none is working with a false array' do
      expect(false_arr.my_none?).to be true
    end

    it 'Checking my_none is working with a true array' do
      expect(true_arr.my_none?).to be false
    end
  end

  describe 'my_count' do
    it 'Checking my_count is working without argument' do
      expect(number_array.my_count).to eql(10)
    end

    it 'Checking my_count is working with argument' do
      expect(number_array.my_count(1)).to eql(1)
    end
  end

  describe 'my_map' do
    it 'Checking my_map is working with array' do
      expect(number_array.my_map { |number| number + 2 }).to eq(number_array.map { |number| number + 2 })
    end

    it 'Checking my_map is working with range' do
      expect((4..15).my_map { |number| number * 2 }).to eq((4..15).map { |number| number * 2 })
    end
  end

  describe 'my_inject' do
    it 'Checking my_inject is working with only symbol' do
      expect(number_array.my_inject(:+)).to eql(number_array.inject(:+))
    end

    it 'Checking my_inject is working with initial value and symbol' do
      expect(number_array.my_inject(1, :*)).to eql(number_array.inject(1, :*))
    end
  end
end
