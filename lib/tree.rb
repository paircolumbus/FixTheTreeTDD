class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize(height = 0, age = 0, apples = [], alive = true)
    @height = height
    @age = age
    @apples = apples
    @alive = alive
  end

  def age!
    # Age our tree by one year
    @age += 1
    
    # Grow our tree a rand height between 1-3 feet per year
    @height += rand(1..3)
    
    # Wait for our tree to age until 5, grow some fruit, then steal it
    if @age >= 5
      rand(100..300).times{ add_apples }
    end
  
    # Our poor tree dies exactly on its 30th birthday, assuming its fruit has been picked
    if @age >= 30
      @alive = false
    end
  end

  def add_apples
    # Push a new red apple. Choose a random diameter size between 5-10 inch 
    @apples.push Apple.new('red', rand(4..10))
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

    # Call our Fruit initialize method
    super()
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
#tree_data
