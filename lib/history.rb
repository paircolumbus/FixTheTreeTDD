class TreeHistory
  attr_reader :life

  def initialize(years)
    @life = years
  end

  def get_year(year)
    @life[year - 1]
  end

  def life_span
    @life.length
  end
end

class TreeData
  attr_reader :height

  def initialize(height)
    @height = height
  end
end

class AppleTreeData < TreeData
  attr_reader :apples

  def initialize(height, apples)
    @height = height
    @apples = apples
  end
end

