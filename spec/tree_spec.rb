require 'rspec'
require 'tree'

describe 'Tree' do
  it 'is a Class' do
    expect(Tree.is_a? Class).to be true
  end

  it 'is initialized' do
    tree = Tree.new
    expect(tree.height).to be 0
    expect(tree.age).to be 0
    expect(tree.alive).to be true
  end
end

describe 'AppleTree' do
  it 'is a Class' do
    expect(AppleTree.is_a? Class).to be true
  end

  it 'is initialized' do
    tree = AppleTree.new
    expect(tree.height).to be 0
    expect(tree.age).to be 0
    expect(tree.alive).to be true
    expect(tree.apples).to eq []
  end

  it 'can be aged' do
    tree = AppleTree.new

    expected_age = 0
    6.times do
      expect(tree.age).to be expected_age
      expect(tree.height).to be expected_age

      tree.age!
      expected_age += 1
    end
    5.times do
      expect(tree.age).to be expected_age
      expect(tree.height).to be 5
      expect(tree.apples.size).to be expected_age - 5

      tree.age!
      expected_age += 1
    end

    tree.age!
    expect(tree.dead?).to be_truthy
  end

  it 'can add apples' do
  	tree = AppleTree.new
  	expect(tree.apples.size).to be 0
  	tree.add_apples
  	expect(tree.apples.size).to be 1
  end

  it 'says if there are any apples' do
    expect(AppleTree.new.any_apples?).to be false

    tree = AppleTree.new
    tree.add_apples
    expect(tree.any_apples?).to be true
  end

  it 'lets you pick an apple' do
  	expect { AppleTree.new.pick_an_apple! }.to raise_error NoApplesError

  	tree = AppleTree.new
  	tree.add_apples
  	expect(tree.pick_an_apple!).to be_an Apple
  	expect(tree.apples.size).to be 0
  end

  it 'tells you if it is dead' do
    expect(AppleTree.new.dead?).to be false

    tree = AppleTree.new
    tree.age! while tree.alive
    expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
  it 'is initialized' do
    fruit = Fruit.new
    expect(fruit.has_seeds).to be true
  end
end

describe 'Apple' do
  it 'is initialized' do
    fruit = Apple.new('green', 3)
    expect(fruit.has_seeds).to be true
    expect(fruit.color).to eq 'green'
    expect(fruit.diameter).to be 3
  end
end
