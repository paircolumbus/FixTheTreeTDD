class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize #constructor to initalize objects
    @height = 1
    @age = 1
    @apples = []
    @alive = true
  end

  def age!
    @age += 1 
    @height += 1
    @alive = false if @age > 15 
    add_apples if @age > 3
  end

  def add_apples
    colors = ["red","green"]
    diameter = rand(1..10)
    number_of_apples = rand(10..20)
    number_of_apples.times do 
      apple = Apple.new(colors.sample,diameter)
      @apples << apple
    end
  end

  def any_apples?
    apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    apple = apples.last
    @apples.pop
    apple
  end

  def dead?
    !alive
  end
end


class Fruit
  attr_reader :has_seeds
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :has_seeds, :color, :diameter 
  def initialize(color, diameter)
    @color = color
    @diameter =  diameter
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

    avg_diameter = diameter_sum / basket.length # It's up to you to calculate the average diameter for this harvest.

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
