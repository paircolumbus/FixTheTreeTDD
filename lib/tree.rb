class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize(max_possible_age=10, max_growth: 3, apple_color: 'orange')
    raise ArgumentError, 'Ages must be positive and non-zero' if max_possible_age <= 0
    raise ArgumentError, 'Growth rates may only be positive and non-zero' if max_growth <= 0

    @height = 0

    @age = 0
    @max_age = rand(1..max_possible_age)
    @max_growth = max_growth

    @apples = []
    @apple_color = apple_color
    @alive = true
  end

  def age!
    @age += 1

    if @age > @max_age
      @alive = false
    else
      @height += rand(1..@max_growth)
      add_apples
    end
  end

  def add_apples
    rand(2..8).times { @apples << make_apple }
  end

  def any_apples?
    !@apples.empty?
  end

  def pick_an_apple!
    raise NoApplesError, 'This tree has no apples' unless self.any_apples?
    @apples.pop
  end

  def dead?
    !@alive
  end

  private
  def make_apple
    Apple.new(@apple_color, rand(2..6))
  end

end

class Fruit
  attr_reader :has_seeds

  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    raise ArgumentError, 'An apple must have a color' if color.nil?
    raise ArgumentError, 'Diameter of an apple may not be negative or zero' if diameter <= 0
    raise ArgumentError, 'Diameter must be finite' if diameter.is_a?(Float) && diameter.infinite?

    super()

    @color = color
    @diameter = diameter
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = basket.map(&:diameter).reduce :+
    avg_diameter = diameter_sum / basket.length

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
# tree_data
