class NoApplesError < StandardError; end

class Tree
  #fill_in :height, :age, :apples, :alive
  attr_reader :apples, :height, :age, :alive

  def initialize	
		@apples = []
		@height = 0
		@age = 0
		@alive = true
	end

  def age!
		@age += 1
		
		# Randomly decide if a tree lives or dies after it reaches 10 years old.
		# The older it gets, the more likely it is to die.		
		# A tree cannot live longer than 50 years.
		if (rand(10..50) < @age) then
			@alive = false
		elsif (@alive)
			if (@age < 5) then
				# Tree grows a random height every year
				@height += rand(1..10)	
			else
				# Produce a random number for apples
				for i in 0..rand(0..5)
					add_apples
				end
			end
		end
  end

  def add_apples
		@apples.push Apple.new 'red', rand(2..6)
  end

  def any_apples?
		@apples.count > 0
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
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
	#what should go here
	attr_reader :diameter 
	attr_reader :color
  
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
		
		# It's up to you to calculate the average diameter for this harvest.
    avg_diameter = basket.count > 0 ? diameter_sum / basket.count : 0

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
