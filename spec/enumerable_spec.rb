require_relative '../enumerable'

describe 'Enumerable' do
    describe 'my_each' do
        it "" do
            my_each_spec = [1, 2, 3, 4]
            expect(my_each_spec.my_each).to eq(my_each_spec.each)  
        end
    end
end