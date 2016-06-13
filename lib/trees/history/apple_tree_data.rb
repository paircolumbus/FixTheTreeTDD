require_relative 'tree_data'

class AppleTreeData < TreeData
  attr_reader :apples

  def initialize(height, apples = [])
    @height = height
    @apples = apples
  end
end

