class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive
  @@colors = ['speckled green', 'yellow', 'rosy', 'bright red']

  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = true
    @maximum_age = 100
    
  end

  def age!
    @age += 1
    grow!
    add_apples if add_apples?
  end

  def grow!
    @height += (0.3 + rand) * 6
  end

  def add_apples?
    @age >= 5
  end

  def add_apples
    number_of_apples = ((0.5 + rand) * (30 + @age)).to_i
    number_of_apples.times do
      color = @@colors.sample
      diameter = (0.5 + rand) * (2 + 2 * rand) # inches
      @apples << Apple.new(color, diameter)
    end
  end

  def any_apples?
    !@apples.empty?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end

  def dead?
    @age > @maximum_age
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

    avg_diameter = diameter_sum / basket.size

    puts "Year #{tree.age} Report"
    puts "Tree height: #{(tree.height/12).to_i} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter.round(2)} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
tree_data
