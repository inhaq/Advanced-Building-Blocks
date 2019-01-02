require "./enumerable.rb"

describe Enumerable do
    a = [1,2,3,4,5]
    describe "#my_count" do
        it "gives size of array" do
            expect(a.my_count).to eq(5)
        end
    end
    describe "#my_map" do
        it 'returns changed array' do
            expect(a.my_map{|x| x*2}).to eq([2,4,6,8,10])
        end
    end
    describe "#my_select" do
        it 'returns selected' do
            expect(a.my_select{|x| x % 2 == 0}).to eq([2,4])
        end
    end 
    describe "#my_any?" do
        it 'returns true if any true' do
            expect(a.my_any?{|x| x > 4}).to eq(true)
        end
    end
    describe "#my_all?" do
        it "return true if all true" do
        expect(a.my_all?{|x| x % 2 == 0}).not_to eq(true)
        end
    end
    describe "#my_inject" do
        it 'it reduces an array' do
            expect(a.my_inject{|x,y| x+y}).to eq(15)
        end
    end
    describe "#my_none?" do
        it "returns true if all false" do
            expect(a.my_none?{|x| x % 2 != 0}).to eq(false)
        end
    end
    describe "#multiply_els" do
        it "multiples elements " do
            expect(a.multiply_els{|x,y| x*y}).to eq(120)
        end
    end
end