require 'rspec'
require '../lib/tree'

RSpec.describe 'Tree' do
  it 'should be a Class' do
    expect(described_class.is_a? 'Class').to be_true
  end
end

RSpec.describe 'Fruit' do
  it 'should be a Class' do
    expect(described_class.is_a? 'Class').to be_true
  end
end

RSpec.describe 'Apple' do
  it 'should be a Class' do
    expect(described_class.is_a? 'Class').to be_true
  end
end
