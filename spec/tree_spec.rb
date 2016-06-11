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

describe 'Apple' do
end
