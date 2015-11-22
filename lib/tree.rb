class NoApplesError < StandardError; end

class Tree
  attr_reader :age, :alive
  attr_accessor :height

  def plant
    "hello"
  end

  def initialize
    @height = 0
    @age = 0
    @alive = true
  end

  def age!
    @age += 1
    @height += rand(1..24) #tree grows 1-24 inches
    @alive = rand() > 0.1 #tree dies 1/10 of the time
  end

  def dead?
    !@alive
  end
end

class AppleTree < Tree
  attr_reader :apples

  def initialize
    super
    @apples = []
  end

  def age!
    super
    if @height > 150
      add_apples
    end
  end

  def add_apples
    rand(1..20).times do
      color = rand() <= 0.5 ? "green" : "red"
      diameter = rand(4..10) #cm
      @apples << Apple.new(color, diameter)
    end
  end

  def any_apples?
    !@apples.empty?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.delete(@apples.sample)
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

  tree.age! until tree.any_apples? || tree.dead?

  puts "Tree is #{tree.age} years old and #{tree.height} inches tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0.0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = diameter_sum / basket.count

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} inches"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} cm"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
tree_data
