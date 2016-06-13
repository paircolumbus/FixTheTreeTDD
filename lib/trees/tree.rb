class Tree
  attr_reader :height, :age, :alive

  def initialize(history)
    @history = history
    @age = 0
    @height = 0
    @alive = true
  end

  def age!
    @age += 1
    if @age > @history.life_span then
      @alive = false
    else
      @height = @history.get_year(@age).height
    end

  end

  def dead?
    !@alive
  end
end

