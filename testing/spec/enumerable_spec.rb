require_relative '../../enumerable'

module Enumerable
  RSpec.describe 'enumerable_methods' do
    let(:array_string) { %w[dog door rod blade] }
    let(:range_number) { (5..10) }
    let(:hash_person) { { name: 'Eddy', height: '180 cm', weight: '200 kilos' } }
    let(:array_int) { [1, 2, 3, 4, 5] }
    let(:array_random) { [nil, true, 99, 'air_string'] }

    context '#my_each' do
      it 'return the same array to the user' do
        expect(array_string.my_each { |x| x }).to eq(array_string)
      end

      it 'return an array with the elments of the range inclusive' do
        expect(range_number.my_each { |x| x }).to eq(range_number)
      end

      it 'return an array with the value of each hash key' do
        expect(hash_person.my_each { |key, _x| key }).to eq(hash_person)
      end
    end

    context '#my_each_with_index' do
      it 'return the same array to the user' do
        expect(array_int.my_each_with_index { |x, _i| x }).to eq(array_int.each_with_index { |x, _i| x })
      end

      it 'return an array of numbers which index is multiples of 4' do
        expect(array_int.my_each_with_index do |x, i|
                 x if i % 4 == 0
               end).to eq(array_int.each_with_index do |x, i|
                            x if i % 4 == 0
                          end)
      end

      it 'return an array with the elments of the range inclusive' do
        expect(range_number.my_each_with_index { |x, _i| x }).to eq(range_number.each_with_index { |x, _i| x })
      end

      it 'return an array with the value of each_with_index hash key' do
        expect(hash_person.my_each_with_index { |key, _x| key }).to eq(hash_person.each_with_index { |key, _x| key })
      end
    end

    context '#my_select' do
      it 'return an array of numbers which index is multiples of 4' do
        expect(array_int.my_select { |x| x if x % 4 == 0 }).to eq(array_int.select { |x| x if x % 4 == 0 })
      end

      it 'return an array of numbers which index is multiples of 4' do
        expect(range_number.my_select { |x| x if x % 4 == 0 }).to eq(range_number.select { |x| x if x % 4 == 0 })
      end

      it 'return an array of numbers which index is multiples of 4' do
        expect(array_string.my_select { |x| x if x % 4 == 0 }).to eq(array_string.select { |x| x if x % 4 == 0 })
      end
    end

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

      it 'if array is empty return true' do
        expect([].my_any?).to eq(false)
      end
    end
  end
end
