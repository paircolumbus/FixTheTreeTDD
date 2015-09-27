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

  it "tree lives 30 years" do
    30.times { tree.age! }
    expect(tree.dead?).to be false
  end

  it "tree does not live 31 years" do
    31.times { tree.age! }
    expect(tree.dead?).to be true
  end

  it "pick_an_apple! throws exception if no apples" do
    begin
      tree.pick_an_apple!
      fail
    rescue => e
      expect(e.is_a? NoApplesError).to be true
    end
  end
    
  it "pick_an_apple! returns an apple" do
    3.times { tree.age! }
    apple = tree.pick_an_apple!
    expect(apple.is_a? Apple).to be true
  end

end

describe Fruit do
  it 'should be a class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  let(:apple) { Apple.new('red', 5) }
  it 'should be a class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have the right color' do
    expect(apple.color).to eq 'red'
  end

  it 'should have the right diameter' do
    expect(apple.diameter).to eq 5
  end

end
