class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :alive
  TREE_DEATH_AGE = 60
  def initialize
    @height = 0
    @age = 0
    @alive = true
  end

  def age!
    @age += 1
  end

  def dead?
    @age > TREE_DEATH_AGE
  end
end

class AppleTree < Tree
  attr_reader :apples

  def initialize
    super
    @apples = []
  end

  def add_apples(apples)
    @apples.concat apples
  end

  def any_apples?
    apples.any?
  end

  def pick_an_apple
    raise NoApplesError, 'This tree has no apples' unless any_apples?
  end
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    super()
    @color = color
    @diamter = diameter
  end
end

# THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = AppleTree.new

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    basket << tree.pick_an_apple! while tree.any_apples?

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = 0 # It's up to you to calculate the average diameter for this harvest.

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ''

    # Ages the tree another year
    tree.age!
  end

  puts 'Alas, the tree, she is dead!'
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
# tree_data
