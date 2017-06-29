require 'rspec'
require 'tree'

tree = Tree.new

describe 'Tree' do
  it 'should be a Class' do
    expect(Tree.is_a? 'Class').to be_true
  end

  context 'when grows one foot' do
    tree.age!
    expect(tree.height).to eq(1)
  end
  context 'when ages one year' do
    expect(tree.age).to eq(1)
  end
  context 'when has no fruit' do
    expect(tree.any_apples?).to be false
  end

  context 'when has apples after 3 years' do
    tree.age!
    tree.age!
    expect(tree.any_apples?).to be true
  end

  context 'when dies after 16 years' do
    (1..13).each{ |idx| tree.age!}
    expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
  it 'is a Class' do
    expect(Fruit.is_a? Class).to be true
  end
end

apple = Apple.new("Red", 30)

describe 'Apple' do
  it 'is a Class' do
    expect(Apple.is_a? Class).to be true
  end

  it 'is a Fruit' do
    expect(Apple < Fruit).to be true  # expects to be inheriting from apple if it is a fruit
  end

  context 'when sets a color' do
    expect(testApple.color).to eq("Red")
  end

  context 'when sets a diameter' do
    expect(testApple.diameter).to eq(30)
  end

  context 'when calls super()' do
    expect(testApple.has_seeds).to be true
  end
end
