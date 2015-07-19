class NoApplesError < StandardError; end

class AppleTree
  attr_reader :height, :age, :apples

  def initialize
    @age = 0
    @apples = []
    @height = 0
  end

  def age!
    if !dead?
      @age += 1
      @height = @age*10 if @height < 60
    end
    add_apples if @age > 3 
    @apples = [] if dead?
    self
  end

  def add_apples
    if @age > 3 && !dead?
      rand(1..(@age*10)).times do
        @apples.push(Apple.new('red', rand(1..5)))
      end
    end
    @apples.count
  end

  def any_apples?
    @apples.count > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end

  def dead?
    @age > 100
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

    avg_diameter = basket.size > 0 ? diameter_sum / basket.size : "n/a"

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
