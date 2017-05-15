require 'rspec'
require 'tree'

describe 'Tree' do
  before :each do
    @tree = Tree.new
  end

  it 'should be a Class' do
    expect(@tree.is_a? Tree).to eq true
  end

  it 'should have no (0) age initially' do
    expect(@tree.age).to eq 0
  end

  it 'should have no (0) height initially' do
    expect(@tree.height).to eq 0
  end

  it 'should have no apples initially' do
    expect(@tree.apples.count).to eq 0
  end

  it 'should be alive' do
    expect(@tree.alive).to eq true
  end

  it 'should increase age by 1 when age is called' do
    @tree.age!
    expect(@tree.age).to eq 1
  end

  it 'should increase height every year after its first 5 years' do
    @tree.age!
    expect(@tree.height).not_to eq 0
  end

  it 'should have apples after the first 5 years' do
    5.times{ @tree.age! }
    expect(@tree.apples.count).not_to eq 0
  end

  it 'should die after 30 years' do
    30.times{ @tree.age! }
    expect(@tree.alive).to eq false
  end

  it 'should be able to pick an apple' do
    basket = []
    while @tree.apples.count == 0
      @tree.age!
    end

    basket << @tree.pick_an_apple!
    expect(basket.count).to eq 1
  end

  it 'should decrease the total amount of apples when they are picked' do
    basket = []
    while @tree.apples.count == 0
      @tree.age!
    end

    num_before = @tree.apples.count
    basket << @tree.pick_an_apple!
    expect(@tree.apples.count).not_to eq num_before
  end
end

describe 'Fruit' do
  it 'should be a class' do
    @fruit = Fruit.new
    expect(@fruit.is_a? Fruit).to eq true
  end
end

describe 'Apple' do
  before :each do
    @apple = Apple.new('red', 5)
  end

  it 'should be a class' do
    expect(@apple.is_a? Apple).to eq true
  end

  it 'should have a color' do
    expect(@apple.color).to eq 'red'
  end

  it 'should have a diameter of 5' do
    expect(@apple.diameter).to eq 5
  end
end
