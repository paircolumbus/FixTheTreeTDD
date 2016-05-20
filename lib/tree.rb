class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :alive

  def initialize
    @height = 0
    @age = 0
    @alive = true
  end

  def age!
    @age += 1
    @height = 5 * age
  end

  def dead?
    @age > 10
  end
end

class AppleTree < Tree
  attr_reader :apples #fill_in :height, :age, :apples, :alive

  def initialize
    super
    @apples = []
  end

  def age!
    super
    5.times { add_apples }
  end

  def add_apples
    rand(1..5).times { @apples.push(Apple.new('Red', rand(1..3))) }
  end

  def any_apples?
    @apples.size > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?

    @apples.slice!(0)
  end

end

class Fruit
  attr_reader :has_seeds

  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter #what should go here 

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

    avg_diameter = diameter_sum / basket.size.to_f

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
