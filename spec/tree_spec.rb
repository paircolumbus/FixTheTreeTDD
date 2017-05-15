require 'rspec'
require 'tree'

describe AppleTree do
  let(:apple_tree) { AppleTree.new }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  context 'when aged' do
    it 'should increment age' do
      apple_tree.age!
      expect(apple_tree.age).to eq 1
    end

    it 'should increment height' do
      apple_tree.age!
      expect(apple_tree.height).to eq 1
    end

    it 'should add apples 3x age' do
      apple_tree.age!
      expect(apple_tree.apples.length).to eq 3
    end

    it 'should create a new apple to add' do
      apple_tree.age!
      expect(apple_tree.new_apple.is_a? Apple).to be true
    end

    it 'should not grow after 20 years' do
      21.times { apple_tree.age! }
      expect(apple_tree.height).to eq 20
    end

    it 'should die after 100 years' do
      101.times { apple_tree.age! }
      expect(apple_tree.dead?).to be true
    end
  end

  context 'when picked' do
    it 'should return apple if exists' do
      apple_tree.age!
      expect(apple_tree.pick_an_apple!.is_a? Apple).to be true
    end

    it 'should decrement an apple' do
      apple_tree.age!
      before_pick = apple_tree.apples.length
      apple_tree.pick_an_apple!
      expect(apple_tree.apples.length).to eq before_pick - 1
    end
  end
end

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should inherit from Fruit' do
    expect(described_class).to be < AppleTree
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  let(:apple) { Apple.new("red", 2) }

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should inherit from Fruit' do
    expect(described_class).to be < Fruit
  end

  it 'should have a color' do
    expect(apple.color).to eq 'red'
  end

  it 'should have a diameter' do
    expect(apple.diameter).to eq 2
  end
end
