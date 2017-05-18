require 'rspec'
require 'tree'

describe Tree do

  before :each do
    @tree = Tree.new
  end

  it 'should be a Class' do
    expect(Tree.is_a? Class).to be true
  end
  
  it 'should be newly-planted' do
    expect(@tree.height).to eq 0
    expect(@tree.age).to eq 0
    expect(@tree.apples.size).to eq 0
    expect(@tree.alive).to be true
  end

  it 'should be 1 year old' do
    @tree.age!
    expect(@tree.age).to eq 1
  end

  it 'should have fruit' do
    8.times { @tree.age! }
    expect(@tree.any_apples?).to be true
  end

  it 'should grow more fruit with age' do
    5.times { @tree.age! }
    3.times do
      old_apples = @tree.apples.size
      4.times { @tree.age! }
      new_apples = @tree.apples.size
      expect(new_apples).to be >= old_apples
    end
  end

  it 'should pick apples' do
    8.times { @tree.age! }
    2.times do
      apple = @tree.pick_an_apple!
      expect(apple.is_a? Apple).to be true
      expect(apple.color).to eq 'red'
    end
  end

  it 'should die' do
    26.times { @tree.age! }
    expect(@tree.dead?).to be true
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have seeds' do
    fruit = Fruit.new
    expect(fruit.has_seeds).to be true
  end
end

describe Apple do

  before :each do
    @apple = Apple.new('red', 3)
  end

  it 'should be a Class' do
    expect(Apple.is_a? Class).to be true
  end

  it 'should have seeds' do
    expect(@apple.has_seeds).to be true
  end

  it 'should be red' do
    expect(@apple.color).to eq 'red'
  end

  it 'should be 3 inches in diameter' do
    expect(@apple.diameter).to eq 3
  end
end
