class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize
  	@height = 0
	@age = 0
	@apples = 0
	@alive = true
  end

  def age!
  	@age += 1
	add_apples
	@height += 1
  end

  def add_apples
  	@apples = 2** @age
  end

  def any_apples?
  	@apples > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no oranges" unless self.any_apples?
	@apples -= 1
	apple = Apple.new("red", 2)
	return apple
  end

  def dead?
  	@age >= 4
  end
end

class Fruit
  # TODO come back and look at this later
  attr_reader :has_seeds
  def initialize
    @has_seeds = true
  end

  def has_seeds
  	@has_seeds
  end
end

class Apple < Fruit
  attr_reader :color, :diameter 

  def initialize(color, diameter)
	super()
  	@color = color
	@diameter = diameter
  end

  def diameter()
	@diameter
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

    avg_diameter = diameter_sum/basket.length 

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

#tree_data
