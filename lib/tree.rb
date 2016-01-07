class NoApplesError < StandardError; end

class AppleTree
  attr_accessor :height, :age, :apples, :alive

  def initialize
		@age = 0
		@height = 0
		@apples = 0
		@alive = true
  end

  def age!
		@age += 1

		# Assuming an apple tree grows approximately 0.75 ft per year (no idea if this is accurate or not)
		@height += rand/10 + 0.70

		# Apple trees start producing fruit around age 5 and continue for 20 or so years
		if (@age >= 5)
			add_apples
		end

		# Assume that once the tree stops producing fruit, it is considered dead.
		if (@age >= 25)
			@alive = false
		end
  end

  def add_apples

		# Usually apple trees get up to around 20 feet in height.
		max_expected_height = 20

		# A smaller tree will probably produce fewer apples, thus the output is scaled by
		# the height of the tree. Assume the maximum yield per year is somewhere between 300-500 apples.
		height_factor = @height/max_expected_height
		@apples += (rand(300...500)*height_factor).to_i

	end

  def any_apples?
		if (@apples != 0)
			return true
		else
			return false
		end
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
		@apples -= 1

		# Assume that the diameter of an apple will be somewhere between 2 and 3 inches
		return Apple.new("Red", rand + 2)
  end

  def dead?
		return !alive
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

  def initialize(color, diameter)
		@color = color
		@diameter = diameter
		super() # This line calls the 'initialize' method in Fruit,
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

		# Divide total diameter sum by the number of apples in the basket
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

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
# tree_data
