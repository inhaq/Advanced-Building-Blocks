require_relative '../lib/bubble_sort_by.rb'

describe Array do
    describe '#bubble_sort_by' do
        it 'returns sorted array' do
            expect([5,4,3,2,1].bubble_sort_by).to eq([1,2,3,4,5])
        end
    end
    describe '#bubble_sort_by with block' do
        it 'returns sorted array with block given' do
            expect([1,2,3,4,5].bubble_sort_by{|a,b| b-a }).to eq([5,4,3,2,1])
        end
    end
end