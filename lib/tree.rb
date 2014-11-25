require 'pry'

class NoApplesError < StandardError; end

class AppleTree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @age = 1
    @height = 1
    @apples = []
    @alive = true
  end

  def age!
    @age += 1
    @height += rand(1..5)
    @alive = false if age > 10
    add_apples if age > 3
  end

  def add_apples
    colors = ["red","green","yellow","radioactive"]
    diameter = rand(1..10)
    number_of_apples = rand(10..20)
    number_of_apples.times do 
      apple = Apple.new(colors.sample,diameter)
      @apples << apple
    end
  end

  def any_apples?
    apples.length > 0 ? true : false
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    apple = apples.last
    @apples.pop
    apple
  end

  def dead?
   alive ? false : true
  end
end

class Tree < AppleTree
  attr_reader :age
  def initialize
    super
  end
end 

class Fruit
  attr_accessor :has_seeds
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_accessor :has_seeds, :color, :diameter
  def initialize(color, diameter)
    # super
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

    avg_diameter = diameter_sum / basket.length

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

  # tree_data
