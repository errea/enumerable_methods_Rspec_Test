require_relative '../enumerable'

describe 'Enumerable' do
  let(:words_array) { %w[first second longestword word] }
  let(:hash) { { name: 'kiranitor', phone: 7451251 } }
  let(:number_array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
  let(:empty_array) { [] }
  let(:false_arr) { [false, nil, false] }
  let(:true_arr) { [1, 3, 5 , true] }

  describe 'my_each' do
    it 'checking my_each is working' do
      expect(words_array.my_each{|word| word}).to eq(words_array.each{|word| word}) 
			expect(hash.my_each{ |key, value| key if value == "kiranitor"}).to eql(hash.each{ |key, value| key if value == "kiranitor"})
    end
  end

	describe 'my_each_with_index' do
		it 'cheking my_each_with_index is working' do
			expect(number_array.my_each_with_index{ |number, index| index + 1}).to eql(number.each_with_index{ |number, index| index + 1})
			expect(hash.my_each{ |hash, index| hash if index == 0}).to eql(hash.each_with_index{ |hash, index| hash if index == 0})
		end
	end

	describe 'my_select' do
		it 'cheking my_select is working' do
			expect(number_array.my_select{ |i| (i % 3).zero? }).to eql(number_array.select{ |i| (i % 3).zero? })
			expect(number_array.my_select(&:even?)).to eql(number_array.select(&:even?))
		end
	end

	describe 'my_all?' do
		it 'checking my_all? is working' do
			expect(words_array.my_all? { |word| word.length >= 4 }).to be true
			expect(words_array.my_all?(/k/)).to be false
			expect(words_array.my_all?(Numeric)).to be false
			expect(words_array.my_all?).to be true
			expect(empty_array.my_all?).to be true
		end
	end
end