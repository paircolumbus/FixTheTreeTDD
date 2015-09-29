require 'rspec'
require 'tree'

describe Tree do

  let(:tree){Tree.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end
