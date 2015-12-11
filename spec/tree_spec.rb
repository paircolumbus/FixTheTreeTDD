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
  it 'should be a subclass of Fruit' do
    expect(described_class.ancestors).to include Fruit
  end
end