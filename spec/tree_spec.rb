require 'rspec'
require 'tree'
require 'pry'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
  it 'should be a subclass of Tree' do
    expect(described_class < Tree).to eq true
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
