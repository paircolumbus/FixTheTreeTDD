require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end

  tree = described_class.new
  it 'should initialize properly' do
    expect(tree).to be_an_instance_of Tree
    expect(tree.height).to eq(0)
    expect(tree.age).to eq(0)
    expect(tree.alive).to be_truthy
  end

  it 'should age properly' do
    former_age = tree.age
    former_height = tree.height
    tree.age!
    new_age = tree.age
    expect(new_age).to eq(former_age + 1)
    new_height = tree.height
    expect(new_height > former_height).to be_truthy
    # How to test if the random death thing has worked?  Not sure.
  end

  it 'should have dead? method working properly' do
    expect(tree.dead?).to eq(!tree.alive)
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end

  apple_tree = described_class.new

  it 'should inherit from Tree' do
    expect(apple_tree.is_a? Tree).to be_truthy
  end

  it 'should initialize properly' do
    expect(apple_tree).to be_an_instance_of AppleTree
    expect(apple_tree.height).to eq(0)
    expect(apple_tree.age).to eq(0)
    expect(apple_tree.alive).to be_truthy
    expect(apple_tree.apples).to be_empty
    expect(apple_tree.any_apples?).to be_falsey
  end

  it 'should age properly' do
    former_apple_count = apple_tree.apples.count
    apple_tree.height = 50
    apple_tree.age!
    new_apple_count = apple_tree.apples.count
    expect(new_apple_count == former_apple_count).to be_truthy
    former_apple_count = apple_tree.apples.count
    apple_tree.height = 160
    apple_tree.age!
    new_apple_count = apple_tree.apples.count
    expect(new_apple_count > former_apple_count).to be_truthy
  end

  it 'should allow for apple-picking' do
    former_apple_count = apple_tree.apples.count
    apple_tree.pick_an_apple!
    new_apple_count = apple_tree.apples.count
    expect(former_apple_count - new_apple_count).to eq([1, former_apple_count].min)
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end

  apple = Apple.new("red", 8)

  it 'should be red of green' do
    expect(apple.color == "red" || apple.color == "green").to be_truthy
  end

  it 'should have a diameter' do
    expect(apple.diameter == 8).to be_truthy
  end
end