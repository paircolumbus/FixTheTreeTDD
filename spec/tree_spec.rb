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
    expect(apple_tree.apples).to eq 0
    expect(apple_tree.alive).to eq true
  end

  it 'can bear fruit starting at 5 years' do
    apple_tree.age = 5
    expect(apple_tree.any_apple?).to eq true 
  end

  it 'can not bear fruit if dead' do
    apple_tree.age = 6
    apple_tree.alive = false
    expect(apple_tree.any_apple?).to eq false
  end

  it 'can not bear fruit if less than 5' do
    apple_tree.age = 4
    expect(apple_tree.any_apple?).to eq false
  end

  it 'cannot pick an apple if no apples' do
    # binding.pry
    expect(apple_tree.any_apple?).to eq false
    expect(apple_tree.pick_an_apple!).to raise_error NoApplesError
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

  let(:fruit) { Fruit.new('orange', 4) }

  it 'has seeds if it is a fruit' do
    expect(fruit.has_seeds?).to be true
  end

end

describe 'Apple' do

  let(:apple) { Apple.new('red', 3) }

  it 'has seeds because it is a fruit' do
    expect(apple.has_seeds?).to be true
  end

  it 'is a red apple' do
    expect(apple.color).to eq 'red'
  end

end
