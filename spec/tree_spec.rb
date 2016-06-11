require 'rspec'
require 'tree'

describe AppleTree do
  let(:apple_tree) { AppleTree.new }

  it 'should be a Tree' do
    expect(apple_tree.is_a? Tree).to eq true
  end
end

describe Fruit do
  let(:fruit) { Fruit.new }

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end
end

describe Apple do
  let(:apple) { Apple.new('red', 3) }

  it 'should be a Fruit' do
    expect(apple.is_a? Fruit).to eq true
  end

  it 'should have a color' do
    expect(apple.color).to eq 'red'
  end

  it 'should have a diameter' do
    expect(apple.diameter).to eq 3
  end
end
