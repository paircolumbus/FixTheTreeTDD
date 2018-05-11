class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    self.height = 0
    self.age = 0
    self.apples = []
    self.alive = true
  end

  def age!
    self.age += 1
    self.grow
    self.add_apples

    if self.age > 20
      self.alive = false
    end
  end

  def grow
    if self.height < 20
      self.height += 2
    end
  end

  def add_apples
    if self.age > 3
      5.times { self.apples.push(Apple.new("red", rand(3.0..4.5).round(2))) }
    end
  end

  def any_apples?
    self.apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    apples.shift
  end

  def dead?
    !self.alive
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

    avg_diameter = (diameter_sum / basket.length).round(2)

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
