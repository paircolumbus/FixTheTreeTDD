require 'pry'

class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @height = 1
    @age = 0
    @apples = []
    @alive = true
  end

  def age!
    self.age += 1
    unless self.height >= 20
      self.height += 1
    end
    self.age > 8 ? self.add_apples : false
    self.dead? ? self.alive = false : self.alive = true
  end

  def add_apples
    3.times do self.apples << Apple.new("red", rand(2..4)) end
  end

  def any_apples?
    self.apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    self.apples.pop
  end

  def dead?
    self.age >= 100
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
  #what should go here 

  def initialize(color, diameter)
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

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    # It's up to you to calculate the average diameter for this harvest.
    avg_diameter = diameter_sum/basket.length
      
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

# Tree.new