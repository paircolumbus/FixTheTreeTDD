require 'rspec'
require 'tree'

describe Tree do
  context "Tree with history" do
    let(:tree_heights) { [1, 12, 37, 49, 65] }
    let(:history) { TreeHistory.new(tree_heights) }
    let(:tree) { Tree.new(history) }

    it "should live 5 years" do
      expect(tree.dead?).to eq false

      5.times { tree.age! }
      expect(tree.dead?).to eq true
    end

    it "should change height each year" do
      tree_heights.each do |height|
        expect(tree.height).to eq height
        tree.age!
      end
    end
  end
end

describe AppleTree do
  let(:apple_tree) { AppleTree.new }

  it 'should be a Tree' do
    expect(apple_tree.is_a? Tree).to eq true
  end
end

describe Fruit do
  let(:fruit) { Fruit.new }

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end
end

describe Apple do
  let(:apple) { Apple.new('red', 3) }

  it 'should be a Fruit' do
    expect(apple.is_a? Fruit).to eq true
  end

  it 'should have a color' do
    expect(apple.color).to eq 'red'
  end

  it 'should have a diameter' do
    expect(apple.diameter).to eq 3
  end
end
