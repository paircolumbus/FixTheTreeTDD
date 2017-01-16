require 'rspec'
require 'tree'

describe 'Tree' do
  it 'is a class' do
    expect(Tree.is_a? Class).to be true
  end

  it 'is initialized properly' do
  	tree = Tree.new
  	expect(tree.height).to be 0
  	expect(tree.age).to be 0
  	expect(tree.alive).to be true
  end
end

describe 'AppleTree' do
	it 'is initialized properly' do
		tree = AppleTree.new
		expect(tree.height).to be 0
		expect(tree.age).to be 0
		expect(tree.alive).to be true
		expect(tree.apples).to eq []
	end

	it 'can age' do
		tree = AppleTree.new
		expected_age = 0
		6.times do
			expect(tree.age).to be expected_age
			expect(tree.height).to be expected_age

			tree.age!
			expected_age+=1
		end
		5.times do
			expect(tree.age).to be expected_age
			expect(tree.height).to be 5
			expect(tree.apples.size).to be expected_age -5

			tree.age!
			expected_age+=1
		end

		tree.age!
		expect(tree.dead?).to be_truthy
	end

	it 'can add apples' do
		tree = AppleTree.new
		expect(tree.apples.size).to be 0
		tree.add_apples
		expect(tree.apples.size).to be 1
	end

	it 'says if there are any apples' do
      tree = AppleTree.new
      expect(tree.any_apples?).to be false
      tree.add_apples
      expect(tree.any_apples?).to be true
	end

	it 'lets you pick an apple' do
  	  expect { AppleTree.new.pick_an_apple! }.to raise_error NoApplesError

  	  tree = AppleTree.new
  	  tree.add_apples
  	  expect(tree.pick_an_apple!).to be_an Apple
  	  expect(tree.apples.size).to be 0
	end

	it 'knows if it is dead' do
		tree = AppleTree.new
		expect(tree.dead?).to be false
		tree.age! while tree.alive
		expect(tree.dead?).to be true
	end
end

describe 'Fruit' do
	it 'is initialized properly' do
		fruit = Fruit.new
		expect(fruit.has_seeds).to be true
	end
end

describe 'Apple' do
	it 'is initialized properly' do
		apple = Apple.new('red',4)
		expect(apple.has_seeds).to be true
		expect(apple.color).to eq 'red'
		expect(apple.diameter).to be 4
	end
end
