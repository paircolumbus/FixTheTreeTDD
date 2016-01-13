class NoApplesError < StandardError; end

class Tree
  attr_reader :age, :height

  AGE_INCREASE = 1
  APPLE_COLOR = "green"
  MIN_AGE_OF_APPLE_PRODUCTION = 4
  MAX_AGE_OF_HEIGHT_INCREASE = 7
  MAX_AGE_OF_TREE = 30
  RANGE_OF_APPLE_DIAMETER = 1..3
  RANGE_OF_APPLE_PRODUCTION = 50..300
  RANGE_OF_HEIGHT_INCREASE = 1..2
  STARTING_AGE = 0
  STARTING_HEIGHT = 0

  def initialize
    @age = STARTING_AGE
    @apples = []
    @height = STARTING_HEIGHT
  end

  def age!
    @age += AGE_INCREASE
    @apples = [] if dead?
    @height += rand(RANGE_OF_HEIGHT_INCREASE) if @age <= MAX_AGE_OF_HEIGHT_INCREASE
    add_apples
  end

  def add_apples
    if @age >= MIN_AGE_OF_APPLE_PRODUCTION && !dead?
      rand(RANGE_OF_APPLE_PRODUCTION).times { @apples.push(Apple.new(APPLE_COLOR, rand(RANGE_OF_APPLE_DIAMETER))) }
    end
  end

  def any_apples?
    @apples.any?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end

  def dead?
    @age >= MAX_AGE_OF_TREE
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
    @color = color
    @diameter = diameter
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

    avg_diameter = diameter_sum / basket.count # It's up to you to calculate the average diameter for this harvest.

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