require 'rspec'
require 'tree'

shared_examples 'sanity check' do |tree_class|
	it 'is a class' do
		expect(tree_class.is_a? Class).to eq true
	end
end

describe Tree do
	before :each do
		@tree = Tree.new
	end
	it 'should be a class' do
    expect(described_class).to eq Tree
  end

	it 'should have no apples initially' do
		expect(@tree.apples.count).to eq 0
	end

	it 'should have a height of 0 initially' do
		expect(@tree.height).to eq 0
	end

	it 'should have age of 0 initially' do
		expect(@tree.age).to eq 0
	end	
	
	it 'should initially be alive' do
		expect(@tree.alive).to eq true
	end

	it 'should increase age by 1 when age is called' do
		@tree.age!
		expect(@tree.age).to eq 1
	end

	it 'should grow by atleast 1 unit every every time it ages and is less than 4 years old' do
		@tree.age!
		expect(@tree.height).to be > 0
	end
	
	it 'should not grow after 4 years' do
		for i in 0..5
			@tree.age!
		end
		height_before = @tree.height
		@tree.age!
		expect(@tree.height).to eq height_before
	end

	it 'should start producing apples when its 5 years old' do
		for i in 0..6
			@tree.age!
		end
		expect(@tree.apples.count).to be > 0
	end

	it 'should not produce apples if its younger than 5 years old' do
		@tree.age!
		expect(@tree.apples.count).to eq 0
	end

	it 'should have no apples if younger than 5 years old' do
		@tree.age!
		expect(@tree.any_apples?).to eq false
	end

	it 'should have apples if it is older than 5 years old' do
		for i in 0..5
			@tree.age!
		end
		expect(@tree.any_apples?).to eq true
	end
	it 'should not be alive longer than 50 years' do
		# Since a tree can't live past 50 years, this will ensure its dead.
		for i in 0..51
			@tree.age!
		end
		expect(@tree.alive).to eq false
	end

	it 'should not produce apples if the tree is dead' do
		# Since a tree can't live past 50 years, this will ensure its dead.
		for i in 0..51
			@tree.age!
		end
		number_of_apples = @tree.apples.count
		@tree.age!
		expect(@tree.apples.count).to eq number_of_apples
	end

	it 'should be able to pick an apple' do
		basket = []
		while @tree.apples.count == 0 do
			@tree.age!
		end
		basket << @tree.pick_an_apple!
		expect(basket.count).to eq 1
	end

	it 'should decrease the amount of apples on the tree when an apple is picked' do
		basket = []
		while @tree.apples.count == 0 do
			@tree.age!
		end
		num_apples_before = @tree.apples.count
		basket << @tree.pick_an_apple!	
		expect(@tree.apples.count).to be < num_apples_before
	end
end

describe Fruit do
	it 'should be a class' do
		expect(described_class).to eq Fruit
	end
end

describe Apple do
	before :each do
		@apple = Apple.new 'red', 3
	end

	it 'should be a class' do
		expect(described_class).to eq Apple
	end

	it 'should inherit from Fruit' do
		expect(described_class).to be < Fruit	
	end

	it 'should have a color' do
		expect(@apple.color).to eq 'red'
	end

	it 'should have a diameter' do
		expect(@apple.diameter).to eq 3
	end
end
