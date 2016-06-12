require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to be true
  end

  it 'should initialize' do
    tree = Tree.new
    expect(tree.age).to be 0
    expect(tree.height).to be 0
    expect(tree.alive).to be true
  end

  it 'should age' do
    tree = Tree.new
    expect(tree.age).to be 0
    tree.age!
    expect(tree.age).to be 1
  end

  it 'should not be dead' do
    tree = Tree.new
    expect(tree.age).to be 0
    expect(tree.dead?).to be false
    tree.age!
    expect(tree.age).to be 1
    expect(tree.dead?).to be false
  end

  it 'should be dead' do
    tree = Tree.new
    expected_age = 0
    expect(tree.age).to be 0
    expect(tree.dead?).to be false
    60.times do
      tree.age!
      expected_age += 1

      expect(tree.age).to be expected_age
      expect(tree.dead?).to be false
    end
    tree.age!
    expect(tree.age).to be 61
    expect(tree.dead?).to be true
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to be true
  end

  it 'should initialize' do
    tree = AppleTree.new
    expect(tree.age).to be 0
    expect(tree.height).to be 0
    expect(tree.alive).to be true
    expect(tree.apples.count).to be 0
  end

  it 'should not have apples' do
    tree = AppleTree.new
    expect(tree.any_apples?).to be false
  end

  it 'should add an apple' do
    tree = AppleTree.new
    expect(tree.any_apples?).to be false
    tree.add_apples Array(Apple.new('Blue,', 10))
    expect(tree.any_apples?).to be true
  end
end

describe Fruit do
  it 'should be a class' do
    expect(described_class.is_a?(Class)).to be true
  end
end

describe Apple do
  it 'should be a class' do
    expect(described_class.is_a?(Class)).to be true
  end
end
