require 'rspec'
require 'tree'

describe 'AppleTree' do

  tree = AppleTree.new

  it 'should be a Class' do
    expect(tree.is_a? AppleTree).to eq true
  end

  it 'should age' do
    before_age = tree.age
    tree.age!
    expect(before_age < tree.age).to eq true
  end

  it 'should grow taller with age' do
    before_height = tree.height
    tree.age!
    expect(before_height < tree.height).to eq true
  end

  it 'should produce apples' do
    before_count = tree.apples.count
    tree.add_apples
    expect(before_count < tree.apples.count).to eq true
  end

  it 'should lose apples when picked' do
    before_count = tree.apples.count
    tree.pick_an_apple!
    expect(before_count > tree.apples.count).to eq true
  end

  it 'should die' do
    tree.age = 99
    tree.age!
    expect(tree.dead?).to eq true
  end

end

describe 'Fruit' do
  fruit = Fruit.new

  it 'should be a Class' do
    expect(fruit.is_a? Fruit).to eq true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end
end

describe 'Apple' do
  apple = Apple.new

  it 'should be a Class' do
    expect(apple.is_a? Apple).to eq true
  end

  it 'should have seeds' do
    expect(apple.has_seeds).to eq true
  end

  it 'should be red and 2.5 inches in diameter vy default' do
    expect(apple.color == "red").to eq true
    expect(apple.diameter == 2.5).to eq true
  end

  it 'should take parameters' do
    apple = Apple.new("green", 1.5)
    expect(apple.color == "green").to eq true
    expect(apple.diameter == 1.5).to eq true
  end
end
