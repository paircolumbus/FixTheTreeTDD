require 'rspec'
# require 'pry'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to eq true
  end

  describe '#initialize' do
    tree = Tree.new

    it 'should default height to 0' do
      expect(tree.height).to eq(0)
    end

    it 'should default age to 0' do
      expect(tree.age).to eq(0)
    end

    it 'should be alive' do
      expect(tree.alive).to eq(true)
    end

    it "shouldn't have any apples" do
      expect(tree.apples.size).to eq(0)
    end
  end

  describe '#age!' do
    it 'should increase the age by one year' do
      tree = Tree.new
      tree.age!
      expect(tree.age).to eq(1)
      tree.age!
      expect(tree.age).to eq(2)
    end

    it 'should increase the height by Tree::GROWTH_PER_YEAR' do
      tree = Tree.new
      tree.age!
      expect(tree.height).to eq(Tree::GROWTH_PER_YEAR)
      tree.age!
      expect(tree.height).to eq(Tree::GROWTH_PER_YEAR * 2)
    end
  end

  describe '#add_apples' do
    it 'should add the specified apples to the tree' do
      red_apple = Apple.new('red', 1)
      green_apple = Apple.new('green', 2)
      tree = Tree.new
      tree.add_apples([red_apple, green_apple])
      expect(tree.apples.size).to eq(2)
      expect(tree.apples[0]).to eq(red_apple)
      expect(tree.apples[1]).to eq(green_apple)
    end

    it 'should allow a single apple to be added to the tree' do
      red_apple = Apple.new('red', 1)
      tree = Tree.new
      tree.add_apples(red_apple)
      expect(tree.apples.size).to eq(1)
      expect(tree.apples[0]).to eq(red_apple)
    end
  end

  describe '#any_apples?' do
    it 'should return false for a new Tree without apples' do
      tree = Tree.new
      expect(tree.any_apples?).to eq(false)
    end

    it 'should return true for a Tree that has apples' do
      tree = Tree.new
      tree.add_apples Apple.new('red', 1)
      expect(tree.any_apples?).to eq(true)
    end
  end

  describe '#pick_an_apple!' do
    tree = Tree.new
    it 'should raise an exception for a Tree without apples' do
      expect { tree.pick_an_apple! }.to raise_error(NoApplesError)
    end

    red_apple = Apple.new('red', 1)
    it 'should return an apple for a Tree with apples' do
      tree.add_apples(red_apple)
      expect(tree.pick_an_apple!).to eq(red_apple)
    end

    it 'should decrement the number of apples in the tree' do
      tree.add_apples(red_apple)
      tree.pick_an_apple!
      expect(tree.apples.size).to eq(0)
    end
  end

  describe '#dead?' do
    it 'should return false if the Tree is alive' do
      expect(Tree.new.dead?).to eq(false)
    end

    it 'should return true if the Tree is not alive' do
      dead_yearling = Tree.new(2, 1, [], false)
      expect(dead_yearling.dead?).to eq(true)
    end
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to eq true
  end
end

describe Apple do
  let(:apple) { described_class.new('red', 10) }

  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to eq true
  end

  it 'should be a Fruit' do
    expect(apple.is_a?(Fruit)).to eq true
  end
end
