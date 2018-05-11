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

  it "is alive" do
    expect(tree.dead?).to be(false)
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

  it "can be harvested for apples" do
    4.times { tree.age! }
    expect(tree.pick_an_apple!).to be_instance_of(Apple)
  end

  it "dies after 20 years" do
    21.times { tree.age! }
    expect(tree.dead?).to be(true)
  end
end

describe 'Fruit' do
  it "has seeds" do
    expect(Fruit.new.has_seeds).to be(true)
  end
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
