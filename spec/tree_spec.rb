require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  let(:tree) { Tree.new }

  it "is initialized as a young tree" do
    expect(tree.age).to eq(0)
  end

  it "can age" do
    tree.age!
    expect(tree.age).to eq(1)
  end

  it "grows as it ages" do
    tree.age!
    expect(tree.height).to eq(2)
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
