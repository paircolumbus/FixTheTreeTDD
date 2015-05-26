require 'rspec'
require 'tree'

describe 'AppleTree' do
	let(:tree) { AppleTree.new }	

	describe '#age' do 
		it 'should show the age of the tree' do 
			expect(tree.age).to eq(0)
		end
	end

	describe '#height' do 
		it 'should show the height of the tree' do 
			expect(tree.height).to eq(0)
		end
	end

	describe '#age!' do
		it 'should change the age' do
			expect{tree.age!}.to change{tree.age}.from(0).to(1)
		end

		it 'should make the tree grow' do 
			expect{tree.age!}.to change{tree.height}.by(3)
		end

		it 'should cause the tree to eventually die' do 
			99.times {tree.age!}
			expect(tree.alive?).to eq(false)
		end
	end
end
	
describe 'Fruit' do
	let(:fruit) {Fruit.new}

	it 'should tell if the fruit has seeds' do
		expect(fruit.has_seeds).to eq(true)
	end
end

describe 'Apple' do
	let(:apple) {Apple.new("red", 3)}

	it 'should show the color of the apple' do
		expect(apple.color).to eq("red")
	end

	it 'should show the diameter of the apple' do
		expect(apple.diameter).to eq(3)
	end
end
