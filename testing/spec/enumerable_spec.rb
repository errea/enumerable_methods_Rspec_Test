require_relative '../../enumerable'

module Enumerable
  RSpec.describe 'enumerable_methods' do
    let(:array_string) { %w[dog door rod blade] }
    let(:range_number) { (5..10) }
    let(:hash_person) { { name: 'Eddy', height: '180 cm', weight: '200 kilos' } }
    let(:array_int) { [1, 2, 3, 4, 5] }
    let(:array_random) { [nil, true, 99, 'air_string'] }

    # my_each ========================================================================================
    context '#my_each' do
      it 'return the same array to the user' do
        expect(array_string.my_each { |x| x }).to eq(array_string.each { |x| }) # enforcing empty block usage
      end

      it 'return an array with the elments of the range inclusive' do
        expect(range_number.my_each { |x| x }).to eq(range_number.my_each { |x| }) # enforcing empty block usage
      end

      it 'return an array with the value of each hash key' do
        expect(hash_person.my_each { |key, _x| key }).to eq(hash_person.my_each { |key, _x| }) # enforcing empty block
      end
    end

    # my_each_with_index =============================================================================
    context '#my_each_with_index' do
      it 'return the same array to the user' do
        expect(array_int.my_each_with_index { |x, _i| x }).to eq(array_int.each_with_index { |x, _i| x })
      end

      it 'return an array of numbers which index is multiples of 4' do
        expect(array_int.my_each_with_index do |x, i|
                 x if (i % 4).zero?
               end).to eq(array_int.each_with_index do |x, i|
                            x if (i % 4).zero?
                          end)
      end

      it 'return an array with the elments of the range inclusive' do
        expect(range_number.my_each_with_index { |x, _i| x }).to eq(range_number.each_with_index { |x, _i| x })
      end

      it 'return an array with the value of each_with_index hash key' do
        expect(hash_person.my_each_with_index { |key, _x| key }).to eq(hash_person.each_with_index { |key, _x| key })
      end
    end

    # my_select? ======================================================================================
    context '#my_select' do
      it 'return an array of numbers which index is multiples of 4' do
        expect(array_int.my_select { |x| x if (x % 4).zero? }).to eq(array_int.select { |x| x if (x % 4).zero? })
      end

      it 'return an array of numbers which index is multiples of 4' do
        expect(range_number.my_select { |x| x if (x % 4).zero? }).to eq(range_number.select { |x| x if (x % 4).zero? })
      end

      it 'return an array of numbers which index is multiples of 4' do
        expect(array_string.my_select do |x|
                 x if x.include?('a')
               end).to eq(array_string.select do |x|
                            x if x.include?('a')
                          end)
      end
    end

    # my_all? =========================================================================================
    context '#my_all?' do
      it 'if every word of the array has a length more or iqual to 7 return true, else false' do
        expect(array_string.my_all? { |word| word.length >= 7 }).to eq(false)
      end

      it 'if every word of the array has a length more or iqual to 3 return true, else false' do
        expect(array_string.my_all? { |word| word.length >= 3 }).to eq(true)
      end

      it 'if every word of the array match the regexp return true, else false' do
        expect(array_string.my_all?(/d/)).to eq(true)
      end

      it 'if every word of the array match the regexp return true, else false' do
        expect(array_string.my_all?(/z/)).to eq(false)
      end

      it 'if every word of the array belong to String class return true, else false' do
        expect(array_string.my_all?(String)).to eq(true)
      end

      it 'if every item of the array is a truthy return true, else false' do
        expect(array_random.my_all?).to eq(false)
      end

      it 'if array is empty return true' do
        expect([].my_all?).to eq(true)
      end
    end

    # my_any? =========================================================================================
    context '#my_any?' do
      it 'if any word of the array has a length more or iqual to 7 return true, else false' do
        expect(array_string.my_any? { |word| word.length >= 7 }).to eq(false)
      end

      it 'if any word of the array has a length more or iqual to 3 return true, else false' do
        expect(array_string.my_any? { |word| word.length >= 3 }).to eq(true)
      end

      it 'if any word of the array match the regexp return true, else false' do
        expect(array_string.my_any?(/d/)).to eq(true)
      end

      it 'if any word of the array match the regexp return true, else false' do
        expect(array_string.my_any?(/z/)).to eq(false)
      end

      it 'if any word of the array belong to String class return true, else false' do
        expect(array_random.my_any?(String)).to eq(true)
      end

      it 'if any item of the array is a truthy return true, else false' do
        expect(array_random.my_any?).to eq(true)
      end

      it 'if array is empty return false' do
        expect([].my_any?).to eq(false)
      end
    end

    # my_none? =========================================================================================
    context '#my_none?' do
      it 'if none word of the array has a length more or iqual to 7 return true, else false' do
        expect(array_string.my_none? { |word| word.length >= 7 }).to eq(true)
      end

      it 'if no word of the array has a length more or iqual to 3 return true, else false' do
        expect(array_string.my_none? { |word| word.length >= 3 }).to eq(false)
      end

      it 'if no word of the array match the regexp return true, else false' do
        expect(array_string.my_none?(/d/)).to eq(false)
      end

      it 'if no word of the array match the regexp return true, else false' do
        expect(array_string.my_none?(/z/)).to eq(true)
      end

      it 'if no word of the array belong to String class return true, else false' do
        expect(array_random.my_none?(String)).to eq(false)
      end

      it 'if no item of the array is a truthy return true, else false' do
        expect(array_random.my_none?).to eq(false)
      end

      it 'if array is empty return true' do
        expect([].my_none?).to eq(true)
      end
    end

    # my_count ==========================================================================================
    context '#my_count' do
      it 'count the number of items in the given array' do
        expect(array_int.my_count).to eq(5)
      end

      it 'count the number of occurences (number 2) in the given array' do
        expect(array_int.my_count(2)).to eq(1)
      end

      it 'count the number of even items in the given array' do
        expect(array_int.my_count(&:even?)).to eq(2)
      end
    end

    # my_map ========================================================================================
    context '#my_map' do
      it 'return the item of the array multiplied by the times of the index number' do
        expect(array_string.my_map.with_index { |x, i| x * i }).to eq(array_string.map.with_index { |x, i| x * i })
      end

      it 'replace each item of the array with the given word (cat)' do
        expect(array_int.my_map { 'cat' }).to eq(array_int.map { 'cat' })
      end

      it 'sum each item of the range with itself. If both a proc and a block are passed, only consider the proc' do
        my_proc = proc { |i| i * i }
        expect(range_number.my_map(my_proc) { |i| i + i }).to eq(range_number.map { |i| i * i })
      end
    end

    # my_inject =====================================================================================
    context '#my_inject' do
      it 'return the sum of the items of a given array by passing the sum symbol' do
        expect(array_int.my_inject(:+)).to eq(array_int.inject(:+))
      end

      it 'return the sum of the items of a given array by passing a proc instead of the sum symbol' do
        expect(array_int.my_inject { |sum, n| sum + n }).to eq(array_int.inject { |sum, n| sum + n })
      end

      it 'return the multiplication of the items of a given array starting with 1' do
        expect(array_int.my_inject(1, :*)).to eq(array_int.inject(1, :*))
      end
    end

    # multiply_els =====================================================================================
    context 'multiply_els' do
      it 'return the multiplication of the items of a given array' do
        expect(multiply_els(array_int)).to eq(array_int.inject(1, :*))
      end
    end
  end
end
