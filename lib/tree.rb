require 'pry'

class NoApplesError < StandardError; end

class Tree 
  attr_accessor :age, :height, :alive
  attr_reader :max_age

  def initialize
    @age = 0
    @height = 0
    @alive = true
    @max_age = 200

  end 

  def age! 
    @age += 1
    @height += 5
    if age == max_age
      @alive = false 
    end  
  end 

  def dead? 
    alive == false
  end 
end 


class AppleTree < Tree 
  FRUIT_BEARING_AGE = 20

  attr_accessor :apples

  def initialize
    @apples = 0
    super 
    @max_age = 30 #unrealistic tree age just for the sake of running this quickly
  end

  def age!
    add_apples
    super
  end 

  def add_apples
    if @age >= FRUIT_BEARING_AGE
      @apples += rand(10..20)
    end
  end

  def any_apples?
    @apples > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples -= 1 
    Apple.new
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

  def initialize(color="red") 
    @color = color
    @diameter = rand(1.0..4.0)
  end
end

# #THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# # avg_diameter (line 58) will raise an error.
# # it should calculate the diameter of the apples in the basket

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

    avg_diameter = diameter_sum / basket.size

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

tree_data

