class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive
  
  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = true
  end

  def age!
    @age += 1
    @height += 1
    add_apples
    if @age >= 100 then @alive = false end
  end

  def add_apples
    apples_to_grow = @age * 5
    
    apples_to_grow.times do
      @apples << grown_apple
    end
  end

  def grown_apple
    Apple.new("red", rand(5..15))
  end

  def any_apples?
    !@apples.empty?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end

  def dead?
    !@alive
  end
end

class Fruit
  attr_accessor :has_seeds
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_accessor :color, :diameter

  def initialize(color, diameter)
    super()
    @color, @diameter = color, diameter
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
tree_data
