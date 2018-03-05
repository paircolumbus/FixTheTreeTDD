require 'rspec'
require 'tree'

def kill_tree(tree)
  10.times { tree.age! }
end

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  describe '#pick_an_apple!' do
    it 'should raise when there are no apples' do
      tree = Tree.new
      expect { tree.pick_an_apple! }.to raise_error(NoApplesError)
    end

    it 'shoud remove an apple' do
      tree = Tree.new
      tree.age!
      tree.pick_an_apple!
      expect(tree.any_apples?).to eq false
    end
  end

  describe '#any_apples?' do
    it 'should return true when there are apples' do
      tree = Tree.new
      tree.age!
      expect(tree.any_apples?).to eq true
    end

    it 'should return false when there are not apples' do
      tree = Tree.new
      expect(tree.any_apples?).to eq false
    end
  end

  describe '#age!' do
    it 'should increase the age of the tree' do
      tree = Tree.new
      tree.age!
      expect(tree.age).to eq 1
    end

    it 'should increase the height of the tree' do
      tree = Tree.new
      tree.age!
      expect(tree.height).to eq 1
    end

    it 'should raise when the tree is dead' do
      tree = Tree.new
      kill_tree(tree)
      expect { tree.age! }.to raise_error(DeadTreeError)
    end
  end

  describe '#dead?' do
    it 'should return true when the tree is not alive' do
      tree = Tree.new
      kill_tree(tree)
      expect(tree.dead?).to eq true
    end
    
    it 'should return false when the tree is alive' do
      tree = Tree.new
      expect(tree.dead?).to eq false
    end
  end

  describe '#add_apples' do
    it 'should raise when the tree is dead' do
      tree = Tree.new
      kill_tree(tree)
      expect { tree.add_apples }.to raise_error(DeadTreeError)
    end

    it 'should add apples ' do
      tree = Tree.new
      expect(tree.any_apples?).to eq false
      tree.age!
      expect(tree.any_apples?).to eq true
    end
  end

end

describe Fruit do

end

describe Apple do
  it 'should have seeds when created' do
    apple = Apple.new(1, 'blue')
    has_seeds = apple.has_seeds
    expect(has_seeds).to eq true
  end
end
