require 'rspec'
require 'tree'
require 'pry'

describe Tree do
	let(:newTree) {described_class.new}

	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end

	it 'should be alive with age = 1 ,height = 1 and no apples when planted' do
		expect(newTree.any_apples?).to be false
		expect(newTree.age).to eq 1
		# binding.pry
		expect(newTree.height).to eq 1
		expect(newTree.dead?).to be false
	end	

	it 'should add 1 to the age for the tree when age! is called after being planted' do
		newTree.age!
		expect(newTree.age).to eq 2
		expect(newTree.height).to be > 1
	end

	it 'should add apples to the tree when add_apples is called' do
		newTree.add_apples
		# binding.pry
		expect(newTree.any_apples?).to be true
	end

	it 'should reduce the number of apples by one when an apple is picked' do
		newTree.add_apples
		total_apples = newTree.apples.length
		newTree.pick_an_apple!
		expect(newTree.apples.length).to eq (total_apples - 1)
	end


end

describe Fruit do
	let(:fruit) {described_class.new}

	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end

	it 'should have seeds' do
		expect(fruit.has_seeds).to be true
	end
end

describe Apple do
	let(:apple) {described_class.new("blue",4)}

	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end

	it 'should be blue in color' do
		expect(apple.color).to eq "blue"
	end

	it 'should be have a diameter of 4' do
		expect(apple.diameter).to eq 4
	end
end
