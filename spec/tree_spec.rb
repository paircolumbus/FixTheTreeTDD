require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  #Creating an instance of the tree class
  let (:tree) {Tree.new}

  it 'should be alive initially' do
      expect(tree.dead?).to eq false
  end

  it 'should have no apples initially' do
    expect(tree.any_apples?).to eq false
  end

  it 'should grow and age' do
    tree.age!
    expect(tree.age > 0).to true
  end

  it 'should add apples after certain age' do
    tree.add_apples(10)
    expect(tree.any_apples?).to eq true
  end

  it 'pick an apple if available else throw an exception' do
    exepct(tree.pick_an_apple!.is_a? Apple).to eq true
  end

  it 'should die after a certian age'
  tree.age = 100
  expect(tree.dead?).to eq true
end

describe 'Fruit' do
  it 'should be a class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe 'Apple' do
  it 'should be a class' do
    expect(described_class.is_a? Class).to eq true
  end
  it 'Should be a fruit' do
    expect(Apple.superclass).to eq Fruit
  end
end
