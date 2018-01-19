class NoApplesError < StandardError; end

class AppleTree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @apples = 0
    @alive = true
  end

  def age!
    @age+=1
    @alive = false unless @age < 9
    @height+=rand(20)
    self.add_apples
    @age
  end

  def add_apples
    rand(25..100).times{@apples+=1}
  end

  def any_apples?
    @apples != 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples-=1
    Apple.new('Red', rand(1..100))
  end

  def dead?
    !@alive
  end
end

class Fruit
  attr_reader :has_seeds
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter #what should go here

  def initialize(color, diameter)
    @color = color
    @diameter = diameter
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = AppleTree.new

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

    avg_diameter = diameter_sum / basket.count

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
