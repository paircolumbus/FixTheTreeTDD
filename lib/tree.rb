class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize
    @age = 0
    @height = 0
    @alive = true
    @apples = []
  end

  def age!
    if @age <= 10
      @age += 1
      @height += rand(1...3)
      add_apples
    end
    @alive = false if @age > 10
  end

  def add_apples
    rand(1..20).times do
      @apples << Apple.new('red', rand(1..5))
    end
  end

  def any_apples?
    @apples.count > 0
  end

  def pick_an_apple!
    raise NoApplesError, 'This tree has no apples' unless any_apples?
    @apples.shift
  end

  def dead?
    !@alive
  end
end

class Fruit
  attr_reader :has_seeds

  def initialize(has_seeds = true)
    @has_seeds = has_seeds
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    @color = color
    @diameter = diameter
    super(true)
  end
end

# THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    basket << tree.pick_an_apple! while tree.any_apples?

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = diameter_sum / basket.size

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
