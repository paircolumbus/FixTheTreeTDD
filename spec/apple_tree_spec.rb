require 'rspec'
require 'trees/apple_tree'
require 'trees/history/tree_history'
require 'trees/history/apple_tree_data'

describe AppleTree do
  let(:first_harvest) { [2, 1, 2, 3, 3] }
  let(:tree_details) do
    TreeHistory.new([
      AppleTreeData.new(1),
      AppleTreeData.new(3),
      AppleTreeData.new(4),
      AppleTreeData.new(5, first_harvest),
      AppleTreeData.new(6, ([2] * 12) + ([3] * 10) + ([4] * 6)),
      AppleTreeData.new(7, ([2] * 19) + ([3] * 38) + ([4] * 43) + ([5] * 34) + ([6] * 23) + ([7] * 3)),
    ])
  end
  let(:apple_tree) { AppleTree.new("red", tree_details) }

  it 'should be a Tree' do
    expect(apple_tree.is_a? Tree).to eq true
  end

  it 'should bear fruit after aging' do
    4.times { apple_tree.age! }
    expect(apple_tree.apples.length).to eq 5

    first_harvest.each do |apple_spec|
      expect(apple_tree.any_apples?).to eq true
      picked_apple = apple_tree.pick_an_apple!
      expect(picked_apple.color).to eq "red"
      expect(picked_apple.diameter).to eq apple_spec
    end

    expect(apple_tree.any_apples?).to eq false

    apple_tree.age!

    expect(apple_tree.any_apples?).to eq true
    expect(apple_tree.apples.length).to eq 28

    apple_tree.age!

    expect(apple_tree.any_apples?).to eq true
    expect(apple_tree.apples.length).to eq 188
  end
end

