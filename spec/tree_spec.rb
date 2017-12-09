require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should have height' do
    tree = Tree.new
    expect(tree.height).to_not eq nil
  end

  it 'should age' do
    tree = Tree.new
    tree.age!
    expect(tree.height).to eq 1
    expect(tree.age).to eq 1
    expect(tree.apples).to_not eq []
  end

  it 'should add apples' do
    tree = Tree.new
    tree.add_apples
    expect(tree.apples).to_not eq []
  end

  it 'should have apples' do
    tree = Tree.new
    tree.add_apples
    expect(tree.any_apples?).to eq true
  end
end

describe Fruit do
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should create a new Apple' do
    apple = Apple.new("Red", 5)
    expect(apple.color).to eq "Red"
    expect(apple.diameter).to eq 5
  end
end
