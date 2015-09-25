require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe 'Tree' do
  let(:tree) { Tree.new }

  it "age starts at 0" do
    expect(tree.age).to eq 0
  end

  it "#age! increases age by one" do
    tree.age!
    expect(tree.age).to eq 1

    tree.age!
    expect(tree.age).to eq 2
  end

  it "height starts at 1 foot" do
    expect(tree.height).to eq 1
  end

  it "height increases by 1 foot per year" do
    2.times { tree.age! }
    expect(tree.height).to eq 3
  end

  it "no apples at the beginning" do
    expect(tree.any_apples?).to be false
  end

  it "no apples until 3 years" do
    2.times { tree.age! }
    expect(tree.any_apples?).to be false
    tree.age!
    expect(tree.any_apples?).to be true
  end

  it "starts as alive" do
    expect(tree.alive).to be true
    expect(tree.dead?).to be false
  end

end

describe 'Fruit' do
end

describe 'Apple' do
end
