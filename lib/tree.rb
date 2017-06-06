class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = 0
  end

  def age!
    @age += 1
    @height += 1
    @alive = false if @age > 15
    add_apples if @age % 3 == 0
  end

  def add_apples
    (1..10).each do |idx|
      apple = Apple.new("Red", idx)
      @apples.push(apple)
    end
  end

  def any_apples?
    return @apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end

  def dead?
    return !@alive
  end
end

class Fruit
  attr_reader :has_seeds
  
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :diameter
  attr_reader :color 

  def initialize(color, diameter)
    @diameter = diameter
    @color = color

    super()
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

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = if basket.size > 0; diameter_sum / basket.size else 0 end # It's up to you to calculate the average diameter for this harvest.

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
#tree_data
