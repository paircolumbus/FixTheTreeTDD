require 'rspec'
require 'tree'

describe Tree do

  let(:tree) { Tree.new }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should initialize properly' do
    expect(tree.instance_of? Tree).to be true
    expect(tree.age).to eq(0)
    expect(tree.height).to eq(0)
    expect(tree.apples).to be_empty
    expect(tree.alive).to be true
  end

  it 'should age properly' do
    tree.age!
    expect(tree.age).to eq(1)
    expect(tree.height).to eq(1.5)
    expect(tree.any_apples?).to be false
  end

  it 'should grow apples past 5 years' do
    5.times do
      tree.age!
    end
    expect(tree.any_apples?).to be true
  end

  it 'should allow for apple-picking' do
    5.times do
      tree.age!
    end
    while tree.any_apples? do
      tree.pick_an_apple!
    end
    expect(tree.any_apples?).to be false
  end

  it 'should die past 100 years' do
    expect(tree.dead?).to be false
    101.times do
      tree.age!
    end
    expect(tree.dead?).to be true
  end

end

describe Fruit do

  let(:fruit) { Fruit.new }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should initalize properly' do
    expect(fruit.instance_of? Fruit).to be true
    expect(fruit.has_seeds).to be true
  end

end

describe Apple do

  let(:apple) { Apple.new('red', 4) }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should initialize properly' do
    expect(apple.instance_of? Apple).to be true
    expect(apple.color).to eq('red')
    expect(apple.diameter).to eq(4);
    expect(apple.has_seeds).to be true
  end

end
