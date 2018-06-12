class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize(age, apples=[], alive, height)
    @age = age
    @apples = apples
    @alive = alive
    @height = height
  end

  def age! # I'm not sure why this has a bang
    if @age == 50
      @alive = false
    elsif
      @age = @age + 1
    end
  end

  def add_apples(number_of_apples)
    @apples.concat([Apple.new('red', 9)] * number_of_apples)
  end

  def any_apples?
    @apples.length >= 1 ? true : false
  end

  def pick_an_apple!
    if self.any_apples?
      return @apples.pop
    else
      raise NoApplesError, "This tree has no apples"
    end

  end

  def dead?
    !@alive
  end
end

class Fruit
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :has_seeds #what should go here 

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

    avg_diameter = # It's up to you to calculate the average diameter for this harvest.

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
