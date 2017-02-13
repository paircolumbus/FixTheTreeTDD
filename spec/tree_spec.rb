require 'rspec'
require 'tree'

describe 'Tree' do
  it 'should be a Class' do
    tree = Tree.new
    expect(tree.is_a? Tree).to be true
  end

  it 'should start with correct values' do
    tree = Tree.new
    expect(tree.age).to eq 1
    expect(tree.height).to eq 1
    expect(tree.apples).to eq []
    expect(tree.alive).to be true
  end

  it 'should get older' do
    tree = Tree.new
    tree.age!
    expect(tree.age).to eq 2
  end

  it 'should begin growing apples on year 5' do
    tree = Tree.new
    tree.age!
    expect(tree.any_apples?).to be false
    3.times { tree.age! }
    expect(tree.any_apples?).to be true
  end

  it 'should be able to pick apples' do
    tree = Tree.new
    tree.add_apples
    current_count = tree.apples.count
    tree.pick_an_apple!
    expect(tree.apples.count).to eq (current_count - 1)
  end

  it 'should grow 1 foot per year' do
    tree = Tree.new
    tree.age!
    expect(tree.height).to eq 2
    3.times { tree.age! }
    expect(tree.height).to eq 5
  end

  it 'should die at age 100' do
    tree = Tree.new
    101.times { tree.age! }
    expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
  it 'should be a Class' do
    fruit = Fruit.new
    expect(fruit.is_a? Fruit).to be true
  end
end

describe 'Apple' do
  it 'should have color and diameter' do
    apple = Apple.new('red', 3)
    expect(apple.color).to eq 'red'
    expect(apple.diameter).to eq 3
  end
end
