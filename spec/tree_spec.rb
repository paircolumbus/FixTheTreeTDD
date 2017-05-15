require 'rspec'
require 'tree'

describe Tree do
  before(:all) do
    @my_tree = Tree.new
  end  

  it 'should be a Class' do
    expect(@my_tree.is_a? Tree).to be true
  end

  it 'should tell if the tree has any apples' do
    expect(@my_tree.any_apples?).to eq(false)
  end
  
  it 'should age one year on running the age command' do
    @my_tree.age!
    expect(@my_tree.age).to eq(1)
  end

  it 'should add apples on running the add_apples command' do
    @my_tree.add_apples!
    expect(@my_tree.any_apples?).to be true
  end

  it 'should return an apple on running the pick_an_apple command' do
    expect(@my_tree.pick_an_apple.is_a? Apple).to be true
  end

  it 'should tell if the tree is dead' do
    until @my_tree.age > 5
      @my_tree.age!
    end
    expect(@my_tree.dead?).to be true
  end

end

describe Fruit do

  before(:all) do
    @my_fruit = Fruit.new
  end

  it 'should be a Class' do
    expect(@my_fruit.is_a? Fruit).to be true
  end

  it 'should have seeds' do
    expect(@my_fruit.has_seeds).to be true
  end 
end

describe Apple do
  before(:all) do
    @my_apple = Apple.new('blue', 4)
  end

  it 'should be an Apple' do
    expect(@my_apple.is_a? Apple).to be true
  end

  it 'should be a Fruit' do
    expect(@my_apple.is_a? Fruit).to be true
  end

  it 'should be red in color' do
    expect(@my_apple.color).to eq('blue')
  end

  it 'should be 4 units in diameter' do
    expect(@my_apple.diameter).to eq(4)
  end

  it 'should have seeds' do
    expect(@my_apple.has_seeds).to be true
  end
end
