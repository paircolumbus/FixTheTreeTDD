require 'rspec'
require 'tree'

describe 'Tree' do

  let(:tree) { Tree.new }

  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq true
  end

  it 'should have no apples initially' do
    expect(tree.any_apples?).to eq false
  end

  it 'should be able to add/grow apples' do
  	tree.add_apples
    expect(tree.any_apples?).to eq true
  end

  it 'dies after living for 30 years' do
  	32.times { |x| tree.age! }
    expect(tree.dead?).to eq true
  end

  it 'dies when it is 30 feets height' do
  	tree.height = 31
  	tree.age!
  	expect(tree.dead?).to eq true
  end

  it 'should age' do
  	tree.age!
    expect(tree.age).to eq 1
  end

  it 'should be able to pick an apple' do
  	6.times { |x| tree.age! }
    expect(tree.pick_an_apple!.is_a? Apple).to eq true
  end

  it 'should raise problem when no apples' do
    expect{tree.pick_an_apple!}.to raise_error NoApplesError
  end

end

describe 'Fruit' do
  it 'should be a Class' do
    expect(Fruit.is_a? Class).to eq true
  end
end

describe 'Apple' do
  it 'should be a Class' do
    expect(Apple.is_a? Class).to eq true
  end

  it 'should be a Fruit Class' do
    expect(Apple.superclass).to eq Fruit
  end

  it 'has color and diameter' do
    apple = Apple.new('green', 2)
    expect(apple.color).to eq 'green'
    expect(apple.diameter).to eq 2
  end

end
