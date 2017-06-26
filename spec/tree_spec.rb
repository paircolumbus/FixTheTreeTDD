require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should set color' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    expect(appleTree.height).to eq 1
  end

  it 'should set age' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    expect(appleTree.age).to eq 1
  end

  it 'should set apples' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    expect(appleTree.apples.count).to eq 2
  end

  it 'should set alive' do
    apple = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    expect(apple.alive).to eq true
  end

  it 'age! adds one' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    appleTree.age!
    expect(appleTree.age).to eq 2
  end

  it 'age! adds height' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    appleTree.age!
    expect(appleTree.age).to be > 1
  end

  it 'any_apples returns true if greater than zero' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    expect(appleTree.any_apples?).to eq true
  end

  it 'any_apples returns false if nil' do
    appleTree = AppleTree.new(1, 1, nil, true)
    expect(appleTree.any_apples?).to eq false
  end

  it 'any_apples returns false if zero' do
    appleTree = AppleTree.new(1, 1, [], true)
    expect(appleTree.any_apples?).to eq false
  end

  it 'dead? returns true if greater than 50' do
    appleTree = AppleTree.new(1, 55, [], true)
    expect(appleTree.dead?).to eq true
  end

  it 'add apples adds apples' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    appleTree.add_apples
    expect(appleTree.apples.count).to be > 2
  end

  it 'pick apples removes one apple' do
    appleTree = AppleTree.new(1, 1, [Apple.new("Red", 2.5), Apple.new("Red", 3)], true)
    appleTree.pick_an_apple!
    expect(appleTree.apples.count).to eq 1
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should have seeds' do
    fruit = Fruit.new
    expect(fruit.has_seeds).to eq true
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should set color' do
    apple = Apple.new("Red", 2.5)
    expect(apple.color).to eq "Red"
  end

  it 'should set diamter' do
    apple = Apple.new("Red", 2.5)
    expect(apple.diameter).to eq 2.5
  end

  it 'should have seeds' do
    apple = Apple.new("Red", 2.5)
    expect(apple.has_seeds).to eq true
  end
end
