class NoApplesError < StandardError; end

# A class representing an apple tree
class Tree
  MAX_AGE = 20
  FRUIT_AGE = 2
  GROWTH_PER_YEAR = 2 # inches

  attr_accessor :height, :age, :apples, :alive

  def initialize(height = 0, age = 0, apples = [], alive = true)
    @height = height
    @age = age
    @apples = apples
    @alive = alive
    @death_age = rand(0..Tree::MAX_AGE)
  end

  def age!
    if @age < @death_age
      @age += 1
      @height += Tree::GROWTH_PER_YEAR
      if @age > Tree::FRUIT_AGE
        20.times do
          @apples << Apple.new('red', rand(1..4))
        end
      end
    else
      @alive = false
    end
  end

  def add_apples(apples)
    if apples.is_a? Apple
      @apples << apples
    elsif apples.is_a? Array
      @apples += apples
    end
  end

  def any_apples?
    !@apples.empty?
  end

  def pick_an_apple!
    raise NoApplesError, 'This tree has no apples' unless any_apples?
    @apples.pop
  end

  def dead?
    !@alive
  end
end

# Base class for fruits, which all have seeds.
class Fruit
  def initialize
    has_seeds = true
  end
end

# Class representing an Apple, which derives from Fruit, if you didn't know.
class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    @color = color
    @diameter = diameter
  end
end

# THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
#  avg_diameter (line 58) will raise an error.
#  it should calculate the diameter of the apples in the basket

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

    # It's up to you to calculate the average diameter for this harvest.
    avg_diameter = diameter_sum / basket.size.to_f

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ''

    # Ages the tree another year
    tree.age!
  end

  puts 'Alas, the tree, she is dead!'
end

# Uncomment this line to run the script, but BE SURE to comment it before you
# try to run your tests!

tree_data
