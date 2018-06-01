class NoApplesError < StandardError; end
class DeadTreeError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  DEATH_AGE = 60
  FRUIT_AGE = 5

  def initialize(height = 0, age = 0, apples = [], alive = true)
    @height = height
    @age = age
    @apples = apples
    @alive = alive
  end

  def age!
    raise DeadTreeError, "This tree is dead" unless self.alive

    @age += 1
    @height += rand(2..4)
    @alive = @age < DEATH_AGE

    add_apples if @alive && @age >= FRUIT_AGE
  end

  def any_apples?
    @apples.any?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?

    @apples.pop
  end

  def dead?
    !@alive
  end

  def add_apples
    apples_to_add = rand(10..15)

    apples_to_add.times do
      @apples << Apple.new('red', rand(1..4))
    end
  end
end

class Fruit
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
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

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = diameter_sum.to_f / basket.length

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
