require 'rspec'
require 'tree'

shared_examples "sanity check" do |tree_class|
	it 'is a class' do
		expect(tree_class.is_a? Class).to be true
	end
end

shared_examples "start with empty tree" do |tree_class|
	before(:each) do
		@tree = tree_class.new
	end
end

describe 'Tree' do
  include_examples "sanity check", Tree
  include_examples "start with empty tree", Tree

  it 'is initialized properly' do
  	expect(@tree.height).to be 0
  	expect(@tree.age).to be 0
  	expect(@tree.alive).to be true
  end
end

describe 'AppleTree' do
	include_examples "sanity check", AppleTree
	include_examples "start with empty tree", AppleTree

	it 'is initialized properly' do
		expect(@tree.height).to be 0
		expect(@tree.age).to be 0
		expect(@tree.alive).to be true
		expect(@tree.apples).to eq []
	end

	it 'can age' do
		expected_age = 0
		6.times do
			expect(@tree.age).to be expected_age
			expect(@tree.height).to be expected_age

			@tree.age!
			expected_age+=1
		end
		5.times do
			expect(@tree.age).to be expected_age
			expect(@tree.height).to be 5
			expect(@tree.apples.size).to be expected_age -5

			@tree.age!
			expected_age+=1
		end

		@tree.age!
		expect(@tree.dead?).to be_truthy
	end

	it 'can add apples' do
		expect(@tree.apples.size).to be 0
		@tree.add_apples
		expect(@tree.apples.size).to be 1
	end

	it 'says if there are any apples' do
      expect(@tree.any_apples?).to be false
      @tree.add_apples
      expect(@tree.any_apples?).to be true
	end

	it 'lets you pick an apple' do
  	  expect { AppleTree.new.pick_an_apple! }.to raise_error NoApplesError

  	  @tree.add_apples
  	  expect(@tree.pick_an_apple!).to be_an Apple
  	  expect(@tree.apples.size).to be 0
	end

	it 'knows if it is dead' do
		expect(@tree.dead?).to be false
		@tree.age! while @tree.alive
		expect(@tree.dead?).to be true
	end
end

describe 'Fruit' do
	include_examples "sanity check", Fruit
	it 'is initialized properly' do
		fruit = Fruit.new
		expect(fruit.has_seeds).to be true
	end
end

describe 'Apple' do
	include_examples "sanity check", Apple

	it 'is initialized properly' do
		apple = Apple.new('red',4)
		expect(apple.has_seeds).to be true
		expect(apple.color).to eq 'red'
		expect(apple.diameter).to be 4
	end
end
