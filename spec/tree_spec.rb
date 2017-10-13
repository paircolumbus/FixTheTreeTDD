require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should add apples' do
    appleTree = Tree.new
    appleTree.add_apples
    expect(appleTree.apples.count()).to be > 0
  end

  it 'should pick an apple' do
    appleTree = Tree.new
    appleTree.add_apples
    startingApples = appleTree.apples.count()
    appleTree.pick_an_apple!
    endingApples = appleTree.apples.count()
    expect(startingApples).to be > endingApples
  end

  it 'should age' do
    appleTree = Tree.new
    appleTree.age!
    expect(appleTree.age).to eq 1
    expect(appleTree.height).to eq 1
    expect(appleTree.apples.count()).to be > 0
  end

  it 'should reveal alive status' do
    appleTree = Tree.new
    appleTree.age!
    expect(appleTree.dead?).to eq false
  end

  it 'should reveal dead status' do
    appleTree = Tree.new
    16.times { appleTree.age! }
    expect(appleTree.dead?).to eq true
  end
  
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should have seeds' do
    aFruit = Fruit.new
    expect(aFruit.has_seeds).to eq true
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should have seeds' do
    apple = Apple.new("red", 3)
    expect(apple.has_seeds).to eq true
  end

  it 'should have a color' do
    apple = Apple.new("red", 3)
    expect(apple.color).to be_a_kind_of(String)
    expect(apple.color).to eq "red"
  end

  it 'should have a diameter' do
    apple = Apple.new("green", 2)
    expect(apple.diameter).to be_a_kind_of(Numeric)
    expect(apple.diameter).to eq 2
  end
end
