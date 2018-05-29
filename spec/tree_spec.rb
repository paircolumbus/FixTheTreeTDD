require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to eq true
  end
  it 'should be dead at the age of 10' do
    10.times { described_class.age! }
    expect(described_class.dead?).to eq true
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
