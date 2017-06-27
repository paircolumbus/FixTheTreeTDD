require 'rspec'
require 'tree'

tree = Tree.new

describe 'Tree' do
  it 'should be a Class' do
    expect(Tree_class.is_a? 'Class').to be_true
  end

  it 'grows one foot' do
    tree.age!
    expect(tree.height).to eq(1)
  end
  it 'ages one year' do
    expect(tree.age).to eq(1)
  end
  it 'has no fruit' do
    expect(tree.any_apples?).to be false
  end

  it 'has apples after 3 years' do
    tree.age!
    tree.age!
    expect(tree.any_apples?).to be true
  end

  it 'dies after 16 years' do
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
    expect(Apple < Fruit).to be true
  end

  it 'sets a color' do
    expect(testApple.color).to eq("Red")
  end

  it 'sets a diameter' do
    expect(testApple.diameter).to eq(30)
  end

  it 'calls super()' do
    expect(testApple.has_seeds).to be true
  end
end
