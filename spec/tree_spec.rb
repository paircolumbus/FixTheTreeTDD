require 'rspec'
require 'tree'
require 'pry'

describe 'Tree' do

  let(:tree) { Tree.new }

  it 'should be a Class' do
    expect(Tree.is_a? Class).to be true
  end

  it 'can be created' do
    expect(tree).to be_a Tree
    expect(tree.age).to eq 0
    expect(tree.height).to eq 0
    expect(tree.alive).to eq true
  end

  it 'can age' do
    5.times { tree.age! }
    expect(tree.age).to eq 5
  end

  it 'grows a foot per year till 30 ft tall' do
    tree.age = 29
    expect(tree.height).to eq 29
    tree.age = 30
    expect(tree.height).to eq 30
    tree.age = 31
    expect(tree.height).to eq 30
  end

  it 'lives for 100 years' do
    tree.age = 100
    expect(tree.dead?).to eq false
    tree.age = 101
    expect(tree.dead?).to eq true
  end
end

describe 'Apple tree' do

  let(:apple_tree) { AppleTree.new }

  it 'should be a Class' do
    expect(AppleTree.is_a? Class).to be true
  end

  it 'can be created' do
    expect(apple_tree).to be_a AppleTree
    expect(apple_tree.age).to eq 0
    expect(apple_tree.height).to eq 0
    expect(apple_tree.apples).to eq []
    expect(apple_tree.alive).to eq true
  end

  it 'can bear fruit starting at 5 years' do
    apple_tree.age = 5
    expect(apple_tree.any_apples?).to eq true 
  end

  it 'can not bear fruit if dead' do
    apple_tree.age = 6
    apple_tree.alive = false
    expect(apple_tree.any_apples?).to eq false
  end

  it 'can not bear fruit if less than 5' do
    apple_tree.age = 4
    expect(apple_tree.any_apples?).to eq false
  end

  it 'cannot pick an apple if no apples' do
    expect(apple_tree.any_apples?).to eq false
    expect { apple_tree.pick_an_apple! }.to raise_error NoApplesError
  end

  it 'can pick an apple if there are apples' do
    #TODO add this test
  end

  it 'can age' do
    5.times { apple_tree.age! }
    expect(apple_tree.age).to eq 5
  end

  it 'grows a foot per year till 30 ft tall' do
    apple_tree.age = 29
    expect(apple_tree.height).to eq 29
    apple_tree.age = 30
    expect(apple_tree.height).to eq 30
    apple_tree.age = 31
    expect(apple_tree.height).to eq 30
  end

  it 'lives for 100 years' do
    apple_tree.age = 100
    expect(apple_tree.dead?).to eq false
    apple_tree.age = 101
    expect(apple_tree.dead?).to eq true
  end
end

describe 'Fruit' do

  let(:fruit_default) { Fruit.new() }
  let(:fruit_with_kwargs) { Fruit.new(diameter: 8, color: 'purple') }

  it 'has a default color of orange' do
    expect(fruit_default.color).to eq 'orange'
  end

  it 'has a default diameter of 3' do
    expect(fruit_default.diameter).to eq 3
  end

  it 'has seeds if it is a fruit' do
    expect(fruit_default.has_seeds?).to be true
  end

  it 'can have a specified diameter' do
    expect(fruit_with_kwargs.diameter).to eq 8
  end

  it 'can have a specified color' do
    expect(fruit_with_kwargs.color).to eq 'purple'
  end
end

describe 'Apple' do

  let(:apple) { Apple.new() }

  it 'has seeds because it is a fruit' do
    expect(apple.has_seeds?).to be true
  end

  it 'is a red, yellow, or green apple' do
    colors = ['red', 'yellow', 'green']
    expect(colors).to include(apple.color)
  end

  it 'should have a diameter to be between 2.5 and 3.25' do
    expect(apple.diameter).to be >= 2.5
    expect(apple.diameter).to be <= 3.25 
  end
end

describe 'Basket' do
  let(:basket) { Basket.new([2.2, 3.1, 2.4, 5.5]) }
  let(:empty_basket) { Basket.new([]) }
  let(:tree) { AppleTree.new() }

  it 'should be a Class' do
    expect(Basket.is_a? Class).to be true
  end

  it 'can be initialized with an array of diameters' do
    expect(basket.diameter_array).to eq [2.2, 3.1, 2.4, 5.5]
  end

  it 'should have a method for calculating avg diameter' do
    expect(basket.avg_diameter).to eq 3.3
  end

  it 'should have a size' do
    expect(basket.size).to eq 4
  end

  it 'can be empty' do
    expect(empty_basket.size).to eq 0
    expect(empty_basket.avg_diameter).to eq 0
  end

  it 'can be added to if there are any apples' do
    #need to age the tree so there are apples first
    #figure out how to connect basket/tree classes for picking
    basket << tree.pick_an_apple!
    expect(basket.size).to eq 5
  end
end

