require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to be true
  end

  it 'should initialize' do
    tree = Tree.new
    expect(tree.age).to be 0
    expect(tree.height).to be 0
    expect(tree.alive).to be true
  end

  it 'should age' do
    tree = Tree.new
    expect(tree.age).to be 0
    tree.age!
    expect(tree.age).to be 1
  end

  it 'should not be dead' do
    tree = Tree.new
    expect(tree.age).to be 0
    expect(tree.dead?).to be false
    tree.age!
    expect(tree.age).to be 1
    expect(tree.dead?).to be false
  end

  it 'should be dead' do
    tree = Tree.new
    expected_age = 0
    expect(tree.age).to be 0
    expect(tree.dead?).to be false
    60.times do
      tree.age!
      expected_age += 1

      expect(tree.age).to be expected_age
      expect(tree.dead?).to be false
    end
    tree.age!
    expect(tree.age).to be 61
    expect(tree.dead?).to be true
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to be true
  end

  it 'should inherit Tree' do
    expect(described_class).to be < Tree
  end

  it 'should initialize' do
    apple_tree = AppleTree.new
    expect(apple_tree.age).to be 0
    expect(apple_tree.height).to be 0
    expect(apple_tree.alive).to be true
    expect(apple_tree.apples.count).to be 0
  end

  it 'should not have apples' do
    apple_tree = AppleTree.new
    expect(apple_tree.any_apples?).to be false
  end

  it 'should add an apple' do
    apple_tree = AppleTree.new
    expect(apple_tree.any_apples?).to be false
    apple_tree.add_apples Array(Apple.new('Blue,', 10))
    expect(apple_tree.any_apples?).to be true
  end

  it 'it should grow and age' do
    apple_tree = AppleTree.new
    apple_tree.age!
    expect(apple_tree.height).to be 1
    expect(apple_tree.age).to be 1
  end

  it 'it should grow, age, and produce apples' do
    apple_tree = AppleTree.new
    61.times do
      apple_tree.age!
    end
    expect(apple_tree.height.round(1)).to be 30.5
    expect(apple_tree.any_apples?).to be true
    expect(apple_tree.dead?).to be true
  end

  it 'should throw error for no apples' do
    apple_tree = AppleTree.new
    expect { apple_tree.pick_an_apple }.to raise_error(NoApplesError, 'This tree has no apples')
  end

  it 'should pick an apple' do
    apple_tree = AppleTree.new
    4.times do
      apple_tree.age!
    end
    expect(apple_tree.height).to be 4.5
    expect(apple_tree.any_apples?).to be true
    expect(apple_tree.apples.count).to be 1
    apple = apple_tree.pick_an_apple!
    expect(apple.is_a?(Apple)).to be true
    expect(apple_tree.apples.count).to be 0
  end
end

describe Fruit do
  it 'should be a class' do
    expect(described_class.is_a?(Class)).to be true
  end
end

describe Apple do
  it 'should be a class' do
    expect(described_class.is_a?(Class)).to be true
  end

  it 'should inherit Fruit' do
    expect(described_class).to be < Fruit
  end

  it 'should initialize' do
    apple = Apple.new('Blue', 10)
    expect(apple.color).to eq 'Blue'
    expect(apple.diameter).to be 10
  end
end
