require 'rspec'
require 'tree'
require 'pry'

describe Tree do
  let(:tree) { Tree.new }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have an age method' do
    expect(described_class.method_defined? :age).to be true
  end

  it 'should age by 1 year if age is called' do
    tree.age!
    expect(tree.age).to eq 1
  end

  it 'should have one apple if we add an apple' do
    tree.add_apple
    expect(tree.any_apples?).to be true
  end

  it 'should have no apples if we pick an apple' do
    tree.add_apple
    tree.pick_an_apple!
    expect(tree.apples.length).to eq 0
  end

  it 'should bear more than 50 apples at age 6' do
    6.times { tree.age! }
    expect(tree.apples.length).to be > 50 
  end

  it 'should never have more than 1000 apples, no matter how many times add_apple is called' do
    59809.times { tree.add_apple }
    expect(tree.apples.length).to eq 1000
  end

  it 'should be dead after age 100' do
    101.times{ tree.age! }
    expect(tree.dead?).to be true
  end

end

describe Fruit do
  let(:fruit) { Fruit.new }

	it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds).to be true
  end
end

describe Apple do
  let(:apple) { Apple.new("Red", 7) }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should be color Red' do
    expect(apple.color).to eq "Red"
  end

  it 'should have a diameter of 7 inches' do
    expect(apple.diameter).to eq 7
  end
end
