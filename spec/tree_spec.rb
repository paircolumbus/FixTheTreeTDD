require 'rspec'
require 'tree'

describe 'Tree' do

  before(:each) do
    @tree = AppleTree.new
  end

  it 'should be a Class' do
    expect(@tree.is_a? AppleTree).to eq true
  end

  it 'should be a 0 height at beginning' do
    expect(@tree.height).to eq 0
  end

  it 'should be alive at beginning' do
    expect(@tree.dead?).to eq false
  end

  it 'should have 0 apples at beginning' do
    expect(@tree.any_apples?).to eq false
  end

  it 'should not let you pick apples at beginning' do
    expect{@tree.pick_an_apple!}.to raise_error(NoApplesError)
  end

  it 'should not let you pick apples afterward' do
    @tree.add_apples
    val = @tree.pick_an_apple!
    expect(val.is_a? Apple).to eq true
  end

  it 'should increase age with age! method' do
    expect(@tree.age).to eq 0
    expect(@tree.age!).to eq 1
  end

  it 'should die after 25 years' do
    expect(@tree.age).to eq 0
    25.times do
      @tree.age!
    end
    expect(@tree.dead?).to eq true
  end
end

describe 'Fruit' do
  before(:each) do
    @fruit = Fruit.new
  end

  it 'should have seeds' do
    expect(@fruit.has_seeds).to eq true
  end
end

describe 'Apple' do
  before(:each) do
    @fruit = Apple.new
  end

  it 'should be red, have diameter of 5 (by default) and have seeds' do
    expect(@fruit.has_seeds).to eq true
    expect(@fruit.color).to eq 'red'
    expect(@fruit.diameter).to eq 5
  end

  it 'could be yellow, and 10 units in diameter' do
    @fruit = Apple.new('yellow', 10)
    expect(@fruit.has_seeds).to eq true
    expect(@fruit.color).to eq 'yellow'
    expect(@fruit.diameter).to eq 10
  end
end
