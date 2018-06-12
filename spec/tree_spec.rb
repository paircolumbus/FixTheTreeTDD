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
  # TODO any_apples should return true if apples isn't empty
  # TODO any_apples should return true if apples is empty
  # TODO pick_an_apple should pick an apple, remove it from the list ?!
  # TODO pick_an_apple should raise NoApplesError if apples is empty
  # TODO dead should return true if the tree is dead
  # TODO dead should return false if the tree is alive
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
