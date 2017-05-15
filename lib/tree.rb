class NoApplesError < StandardError; end

class AppleTree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = true
  end

  def age!
    if alive
      @age += 1
      @height += 1 unless height >= 20
      add_apples
    end

    @alive = false if age >= 100
  end

  def add_apples
    apples_grown = age * 3

    apples_grown.times do
      @apples << new_apple
    end
  end

  def new_apple
    random_diameter = 2 + rand(4)
    Apple.new('red', random_diameter)
  end

  def any_apples?
    apples.any?
  end

  def pick_an_apple!
    raise NoApplesError, 'This tree has no apples' unless any_apples?
    @apples.pop
  end

  def dead?
    alive == false
  end
end

class Tree < AppleTree
  def initialize
    super
  end
end

class Fruit
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    @color = color
    @diameter = diameter
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
    puts "Harvest: #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
#tree_data
