require 'rspec'
require 'tree'

describe Tree do
  context "Tree with history" do
    let(:tree_details) { [1, 2, 4, 6, 7].map { TreeData.new } }
    let(:history) { TreeHistory.new(tree_details) }
    let(:tree) { Tree.new(history) }

    it "should live 5 years" do
      expect(tree.dead?).to eq false

      (tree_details.length + 1).times { tree.age! }
      expect(tree.dead?).to eq true
    end

    it "should change height each year" do
      tree_details.each do |year|
        expect(tree.height).to eq year.height
        tree.age!
      end
    end
  end
end

describe AppleTree do
  let(:first_harvest) { [2, 1, 2, 3, 3] }
  let(:tree_details) do
    [
      AppleTreeData.new(1, []),
      AppleTreeData.new(3, []),
      AppleTreeData.new(4, []),
      AppleTreeData.new(5, first_harvest),
      AppleTreeData.new(6, ([2] * 12) + ([3] * 10) + ([4] * 6)),
      AppleTreeData.new(7, ([2] * 19) + ([3] * 38) + ([4] * 43) + ([5] * 34) + ([6] * 23) + ([7] * 3)),
    ]
  end
  let(:apple_tree) { AppleTree.new("red", tree_details) }

  it 'should be a Tree' do
    expect(apple_tree.is_a? Tree).to eq true
  end

  it 'should bear fruit after aging' do
    3.times { apple_tree.age! }
    expect(apple_tree.apples).to eq 5

    first_harvest.each do |apple_spec|
      expect(apple_tree.any_apples?).to eq true
      picked_apple = apple_tree.pick_an_apple!
      expect(picked_apple.color).to eq "red"
      expect(picked_apple.diameter).to eq apple_spec
    end

    expect(apple_tree.any_apples?).to eq false

    apple_tree.age!

    expect(apple_tree.any_apples?).to eq true
    expect(apple_tree.apples).to eq 28

    apple_tree.age!

    expect(apple_tree.any_apples?).to eq true
    expect(apple_tree.apples).to eq 160
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

describe "tree_data" do
  let(:output) { double(puts) }
  let(:tree_details) do
    [
      AppleTreeData.new(1, []),
      AppleTreeData.new(3, []),
      AppleTreeData.new(4, []),
      AppleTreeData.new(5, [2, 1, 2, 3, 3]),
      AppleTreeData.new(6, ([2] * 12) + ([3] * 10) + ([4] * 6)),
      AppleTreeData.new(7, ([2] * 19) + ([3] * 38) + ([4] * 43) + ([5] * 34) + ([6] * 23) + ([7] * 3)),
    ]
  end

  it "should describe the life of a tree" do
    tree_data(tree_details)

    # Initial age of tree when starts producing apples
    expect(output).to have_received("Tree is 4 years old and 5 feet tall")

    # Age 4 reports
    expect(output).to have_received("Year 4 Report")
    expect(output).to have_received("Tree height: 5 feet")
    expect(output).to have_received("Harvest:     5 apples with an average diameter of 2.2 inches")
    expect(output).to have_received("")

    # Age 5 reports
    expect(output).to have_received("Year 5 Report")
    expect(output).to have_received("Tree height: 6 feet")
    expect(output).to have_received("Harvest:     28 apples with an average diameter of 2.79 inches")
    expect(output).to have_received("")

    # Age 6 reports
    expect(output).to have_received("Year 6 Report")
    expect(output).to have_received("Tree height: 7 feet")
    expect(output).to have_received("Harvest:     142 apples with an average diameter of 4.08 inches")
    expect(output).to have_received("")

    expect(output).to have_received("Alas, the tree, she is dead!")
  end
end

