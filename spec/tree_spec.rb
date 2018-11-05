require 'rspec'
require_relative '../lib/tree'

def kill_tree(tree)
  # The 12 here is based off of the rand_seed the below
  12.times { tree.age! }
end

def new_test_tree
  # Use a random seed here to make our tests predictable
  tree = Tree.new(rand_seed: 100)
end

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  describe '#pick_an_apple!' do
    it 'should raise when there are no apples' do
      tree = new_test_tree
      expect { tree.pick_an_apple! }.to raise_error(NoApplesError)
    end

    it 'shoud remove an apple' do
      tree = new_test_tree
      tree.age!
      tree.pick_an_apple!
      expect(tree.any_apples?).to eq false
    end
  end

  describe '#any_apples?' do
    it 'should return true when there are apples' do
      tree = new_test_tree
      tree.age!
      expect(tree.any_apples?).to eq true
    end

    it 'should return false when there are not apples' do
      tree = new_test_tree
      expect(tree.any_apples?).to eq false
    end
  end

  describe '#age!' do
    it 'should increase the age of the tree' do
      tree = new_test_tree
      tree.age!
      expect(tree.age).to eq 1
    end

    it 'should increase the height of the tree' do
      tree = new_test_tree
      tree.age!
      expect(tree.height).to eq 1
    end

    it 'should raise when the tree is dead' do
      tree = new_test_tree
      kill_tree(tree)
      expect { tree.age! }.to raise_error(DeadTreeError)
    end

    it 'should set alive to false when the tree is too old' do
      tree = new_test_tree
      kill_tree(tree)
      expect(tree.age).to eq 12
      expect(tree.dead?).to eq true
    end

    it 'should grow in height' do
      tree = new_test_tree
      previous_height = tree.height
      tree.age!
      expect(tree.height).to be > previous_height
    end

    it 'should grow more apples' do
      tree = new_test_tree
      previous_count = tree.apples.size
      tree.age!
      expect(tree.apples.size).to be > previous_count
    end
  end

  describe '#dead?' do
    it 'should return true when the tree is not alive' do
      tree = new_test_tree
      kill_tree(tree)
      expect(tree.dead?).to eq true
    end
    
    it 'should return false when the tree is alive' do
      tree = new_test_tree
      expect(tree.dead?).to eq false
    end
  end

  describe '#add_apples' do
    it 'should raise when the tree is dead' do
      tree = new_test_tree
      kill_tree(tree)
      expect { tree.add_apples }.to raise_error(DeadTreeError)
    end

    it 'should add apples ' do
      tree = new_test_tree
      expect(tree.any_apples?).to eq false
      tree.age!
      expect(tree.any_apples?).to eq true
    end
  end

  describe '#inc_height!' do
    it 'should increase the tree\'s height' do
      tree = new_test_tree
      tree.age!
      expect(tree.height).to eq 1
    end
  end

end

describe Fruit do
  it 'should have seeds when created' do
    f = Fruit.new
    expect(f.has_seeds).to eq true
  end
end

describe Apple do
  it 'should have seeds when created' do
    f = Apple.new('red', 1)
    expect(f.has_seeds).to eq true
  end
end
