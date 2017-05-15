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

