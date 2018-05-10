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

  it "doesn't have apples for 3 years" do
    3.times { tree.age! }
    expect(tree.any_apples?).to be(false)
  end

  it "starts producing apples after 3 years" do
    4.times { tree.age! }
    expect(tree.any_apples?).to be(true)
  end
end

describe 'Fruit' do
end

describe 'Apple' do
  let(:apple) { Apple.new("red", 3.5)}

  it "has a color" do
    expect(apple.color).to eq("red")
  end

  it "has a diameter" do
    expect(apple.diameter).to eq(3.5)
  end

  it "has seeds" do
    expect(apple.has_seeds).to be(true)
  end
end
