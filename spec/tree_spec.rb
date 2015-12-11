require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe 'Fruit' do
end

describe Apple do
  it 'should be a kind of Fruit' do
    expect(described_class.is_a? Fruit).to be true
  end
end
