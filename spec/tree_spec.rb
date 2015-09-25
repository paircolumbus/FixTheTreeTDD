require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe 'Tree' do
  let(:tree) { Tree.new }

  it "starts at age 0" do
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
    tree.age!
    tree.age!
    expect(tree.height).to eq 3
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
