require 'rspec'
require 'tree'
require 'pry'

describe 'Tree' do
  it 'should be a Class' do
    binding.pry
    let(:tree) { Tree.new }
    expect(tree).is_a? Class).to be true
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
