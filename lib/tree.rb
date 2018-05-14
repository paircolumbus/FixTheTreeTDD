class NoApplesError < StandardError; end

class Tree
  attr_accessor :age, :height, :apples, :alive

  def initialize
    @age = 0
    @height = 0
    @apples = []
    @alive = true
  end

  def age!
    self.age += 1
    self.height += 1
    self.add_apples
    if age >= 20
      self.alive = false
    end
  end

  def add_apples
    3.times do self.apples << Apple.new(rand(4..20))
    end
  end

  def any_apples?
    apples.length > 0 ? true : false
  end

  def pick_an_apple!
    unless any_apples?
      raise NoApplesError, "This tree has no apples"
    else
      self.apples.pop
    end
  end

  def dead?
    !alive ? true : false
  end
end

class Fruit
  attr_reader :has_seeds
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_accessor :color, :diameter

  def initialize(diameter)
    super()
    @color = "red"
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

    avg_diameter = diameter_sum / basket.length

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
