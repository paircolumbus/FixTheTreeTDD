require 'rspec'
require 'tree'



describe 'Tree' do

  before(:each) do
    @tree = Tree.new
  end

  it 'should be a Class' do
    expect(Tree.is_a?(Class)).to eql true
  end

  it 'should initialize to [0,0,[],true]' do
    expect([@tree.height, @tree.age, @tree.apples, @tree.alive]).to eql [0,0,[],true]
  end

  it 'should age' do
    @tree.age!
    expect(@tree.age).to eql 1
  end

  it 'should add apples' do
    @tree.age! until @tree.any_apples?
    expect(@tree.apples.count > 0).to eql true
  end

  it 'should return false when there are no apples' do
    expect(@tree.any_apples?).to eql false
  end

  it 'should return an apple when picking' do
    @tree.age! until @tree.any_apples?
    expect(@tree.pick_an_apple!.is_a?(Apple)).to eql true
  end

  it 'should die over 100 years old' do
    100.times { @tree.age! }
    expect(@tree.dead?).to eql true
  end
end

describe 'Fruit' do
  it 'should have seeds' do
    @fruit = Fruit.new
    expect(@fruit.has_seeds).to eql true
  end
end

describe 'Apple' do

  it 'should have seeds' do
    @apple = Apple.new('Green', 6)
    expect(@apple.has_seeds).to eql true
  end

  it 'should have a color' do

    @apple = Apple.new('Green',6)
    expect(@apple.color).to eql 'Green'
  end

  it 'should have a diameter' do
    @apple = Apple.new('Green',6)
    expect(@apple.diameter).to eql 6
  end

end
