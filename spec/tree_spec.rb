require 'rspec'
require 'tree'

describe Tree do
	let(:some_tree) {Tree.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should age tree by 1 year' do
  	some_tree.age!
  	expect(some_tree.age).to eq 1
  end

  it 'should grow tree by 2 feet' do
  	some_tree.age!
  	expect(some_tree.height).to eq 2
  end

  it 'should add apples' do
  	some_tree.add_apples
  	expect(some_tree.apples).to be > 0
  end

  it 'should add apples if tree is 5 or older' do
  	5.times {some_tree.age!}
  	expect(some_tree.age).to eq 5
  	expect(some_tree.apples).to be > 0
  end

  it 'should not add apples if tree is younger than 5' do
  	4.times {some_tree.age!}
  	expect(some_tree.age).to eq 4
  	expect(some_tree.apples).to eq 0
  end

  it 'should have apples if apples are added' do
  	some_tree.add_apples
  	expect(some_tree.any_apples?).to eq true
  end

  it 'should take 1 apple away if an apple is picked' do
  	some_tree.apples = 5
  	some_tree.pick_an_apple!
  	expect(some_tree.apples).to eq 4
  end

  it 'should be dead if over 100' do
  	some_tree.age = 101
  	expect(some_tree.dead?).to eq true
  end

end

describe 'Fruit' do
	let(:some_fruit) {Fruit.new}

	it 'should have seeds' do
		expect(some_fruit.has_seeds).to eq true
	end

end

describe Apple do
	let(:some_apple) {Apple.new("Red", rand)}

	it 'should be a subclass of Fruit' do
		expect(described_class.ancestors).to include Fruit
	end

	it 'should have seeds' do
		expect(some_apple.has_seeds).to eq true
	end

	it 'should have a color' do
		expect(some_apple.color).to eq "Red"
	end

	it 'should have a diameter' do
		expect(some_apple.diameter).to be > 0
	end


end
