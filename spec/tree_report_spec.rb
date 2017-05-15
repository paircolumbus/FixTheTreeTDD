require 'rspec'
require 'trees/tree_report'
require 'trees/history/tree_history'
require 'trees/history/apple_tree_data'

describe "tree_data" do
  let(:reporter) { TreeReporter.new }
  let(:tree_details) do
    TreeHistory.new([
      AppleTreeData.new(1, []),
      AppleTreeData.new(3, []),
      AppleTreeData.new(4, []),
      AppleTreeData.new(5, [2, 1, 2, 3, 3]),
      AppleTreeData.new(6, ([2] * 12) + ([3] * 10) + ([4] * 6)),
      AppleTreeData.new(7, ([2] * 19) + ([3] * 38) + ([4] * 43) + ([5] * 34) + ([6] * 23) + ([7] * 3)),
    ])
  end

  it "should describe the life of a tree" do
    lines = reporter.tree_data(tree_details)

    expected_report = <<-end
Tree is 4 years old and 5 feet tall
Year 4 Report
Tree height: 5 feet
Harvest:     5 apples with an average diameter of 2.2 inches

Year 5 Report
Tree height: 6 feet
Harvest:     28 apples with an average diameter of 2.79 inches

Year 6 Report
Tree height: 7 feet
Harvest:     160 apples with an average diameter of 4.08 inches

Alas, the tree, she is dead!
end

    expected_lines = expected_report.split("\n")

    # Compare expected report to actual lines
    lines.each_with_index do |line, index|
      expect(line).to eq expected_lines[index]
    end
  end
end

