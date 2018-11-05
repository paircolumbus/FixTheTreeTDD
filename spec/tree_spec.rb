require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
  it 'should create an instance of Tree with correct attributes' do
    tree = Tree.new(5, 1, 0, true)
    expect(tree.height).to eq(5);
    expect(tree.age).to eq(1);
    expect(tree.apples).to eq(0);
    expect(tree.alive).to eq(true);
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
  
end

describe Apple do
  it 'Apple should be a subclass of Fruit' do
    expect(Apple).to be < Fruit
  end
  it 'apple should be a an instance of Apple' do
    apple = Apple.new()
    expect(apple).to be_an_instance_of(Apple)
  end
end
