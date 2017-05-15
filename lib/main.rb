require_relative 'trees/tree_report'
require_relative 'trees/history/tree_history'
require_relative 'trees/history/apple_tree_data'

data = TreeHistory.new([
  AppleTreeData.new(1),
  AppleTreeData.new(3),
  AppleTreeData.new(4, [1, 1, 1, 1, 1, 2]),
  AppleTreeData.new(6, [2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 3, 1, 1]),
])

reporter = TreeReporter.new

reporter.tree_data(data).each {|line| puts line }

