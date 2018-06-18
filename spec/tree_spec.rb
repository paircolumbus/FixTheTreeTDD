require 'rspec'
require_relative '../lib/tree'

describe Tree do
  let(:tree) { Tree.new(1, [], true, 1) }
  
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'is born with the age of 1' do
    expect(tree.age).to be 1
  end

  it 'is born with the height of 1 foot' do
    expect(tree.height).to be 1
  end

  it 'is born alive' do
    expect(tree.alive).to be true
  end

  it 'is born with no apples' do
    expect(tree.apples.length).to be 0
  end

  # TODO age! should modify age ?!
  it 'ages by one year everytime age! is called' do
    tree.age = 1
    tree.age!
    expect(tree.age).to be 2
  end
  
  it 'grows n apples if add_apples is called with n number of apples' do
    tree.add_apples 10
    expect(tree.apples.length).to be 10
  end
  
  it 'returns true if the tree has grown apples' do
    tree.add_apples(1)
    expect(tree.any_apples?).to be true
  end

  it 'returns false if the tree has no apples' do
    expect(tree.any_apples?).to be false
  end
  
  it 'returns an apple when pick_an_apple is called' do
    expect(tree.any_apples?).to be false
    tree.add_apples 1
    expect(tree.pick_an_apple!).to be_an_instance_of(Apple)
    expect(tree.any_apples?).to be false
  end

  it 'raises an error if the tree has no apples' do
    expect { tree.pick_an_apple! }.to raise_error(NoApplesError)
  end

  it 'is dead when calling dead? is returns true' do
    tree.age = 50
    tree.age!
    expect(tree.dead?).to be true
  end

  it 'is alive when calling dead? returns false' do
    expect(tree.dead?).to be false
  end
end

describe Fruit do

  context 'when initialized' do
    it { is_expected.to be_an_instance_of(Fruit) }
  end

end

describe Apple do
  let(:apple) {Apple.new('green', 10)}

  it 'is a Fruit' do
    expect(apple).to be_a_kind_of(Fruit)
  end

  it 'has seeds' do
    # TODO Apple should be a subclass of Fruit
    expect(apple).to be_an_instance_of(Apple)
    #expect(apple::has_seeds).to be_true
  end
  
end
