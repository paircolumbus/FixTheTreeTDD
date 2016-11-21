class NoApplesError < StandardError; end

class AppleTree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @age = 0
    @height = 0
    @apples = []
    @alive = true
  end

  def age!
    if age < 30
      @age += @age
      @height += @height
      if @age > 5
        add_apples
      end
    else
      @alive = false     
    end
  end

  def add_apples
    rand(1..4).times {@apples << Apple.new} 
  end

  def any_apples?
    !@apples.empty?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.shuffle.pop
  end

  def dead?
    !@alive
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
    @color = ["red", "green", "yellow"].sample
    @diameter = rand(1.0..4.0).round(2)
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
