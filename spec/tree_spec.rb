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
    expect(apple_tree.alive).to eq true
  end

  it 'can bear fruit starting at 5 years' do
    5.times { apple_tree.age! }
    expect(apple_tree.any_apples?).to eq true 
    expect(apple_tree.number_of_apples).to be >= 5
    expect(apple_tree.number_of_apples).to be <= 20
  end

  it 'can not bear fruit if dead' do
    apple_tree.alive = false
    expect(apple_tree.any_apples?).to eq false
  end

  it 'can not bear fruit if less than 5' do
    4.times { apple_tree.age! }
    expect(apple_tree.any_apples?).to eq false
  end

  it 'cannot pick an apple if no apples' do
    apple_tree.number_of_apples = 0
    expect(apple_tree.any_apples?).to eq false
    expect { apple_tree.pick_an_apple! }.to raise_error NoApplesError
  end

  it 'can pick an apple if there is one apple' do
    5.times { apple_tree.age! }
    apple_tree.number_of_apples = 1
    expect(apple_tree.any_apples?). to be true
    apple = apple_tree.pick_an_apple!
    expect(apple.class).to eq Apple
  end

  it 'can pick an apple if there are multiple apples' do
    6.times { apple_tree.age! }
    apple = apple_tree.pick_an_apple!
    expect(apple.class).to eq Apple
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

  it 'should have a diameter between 2.5 and 3.25, inclusive' do
    expect(apple.diameter).to be >= 2.5
    expect(apple.diameter).to be <= 3.25 
  end
end


describe 'Basket' do

  let(:basket) { Basket.new() }
  let(:tree) { AppleTree.new() }

  it 'should be a Class' do
    expect(Basket.is_a? Class).to be true
  end

  it 'has no apples when initialized' do
    apples = []
    expect(basket.size).to eq 0
    expect(basket.avg_diameter).to eq 0
  end

  it 'can calculate an average diameter' do
    6.times { tree.age! }
    6.times { basket.apples << tree.pick_an_apple! }

    # Replace random diameters with known ones for the test
    diameters = [2.6, 3.25, 2.9, 2.8, 3.1, 2.5]
    basket.apples.map.with_index { |apple, i| apple.diameter = diameters[i] }
    
    expect(basket.size).to eq 6
    expect(basket.avg_diameter).to eq 2.9
  end

  it 'can be empty' do
    expect(basket.size).to eq 0
    expect(basket.avg_diameter).to eq 0
  end

  it 'can be added to' do
    63.times { tree.age! }
    1.times { basket.apples << tree.pick_an_apple! }
    expect(basket.size).to eq 1
  end
end
