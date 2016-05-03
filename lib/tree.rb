require 'pry'

class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :bears_fruit
  def initialize(height, bears_fruit)
    @height = height
    @bears_fruit = bears_fruit
  end
end

class FruitTree < Tree
  attr_reader :fruits
  def initialize(height, fruits)
    @fruits = fruits
    super(height, true)
  end
end

class AppleTree < FruitTree

  attr_reader :age, :apples

  def initialize(height, age, apples)
    @apples = []
    @apples +=  apples
    @age = age
    super(height, apples)
  end

  def age!
    @age += 1
  end

  def add_apples(*more_apples)
    @apples = @apples + more_apples
  end

  def any_apples?
    @apples.count > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.shift
  end

  def dead?
    @age == 10
  end
end

class Fruit
  attr_reader :color, :diameter, :has_seeds
  def initialize(color, diameter, has_seeds)
    @color = color
    @diameter = diameter
    @has_seeds = has_seeds
  end
end

class Apple < Fruit
  def initialize(diameter)
    # we hate green apples or any other colored apples
    super('red', diameter, true)
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data

  tree = AppleTree.new(20, 4, [Apple.new(4.2), Apple.new(3.1), Apple.new(4.5), Apple.new(3.8)])

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?

    basket = []

    (rand(4) .. 4 + rand(7)).each do |x|
      tree.add_apples(Apple.new(x))
    end

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = 0

    # It's up to you to calculate the average diameter for this harvest.

    if basket.count > 0
      avg_diameter = diameter_sum / basket.count
    end

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
tree_data
