class NoApplesError < StandardError; end


class Tree
  attr_reader :height, :age, :apples, :alive
  
  def initialize
    @height = 0
    @age = 0
    @alive = true
    @maximum_age = 125 * (0.5 + rand)
  end

  def age!
    @age += 1
    grow!
  end

  def grow!
    @height += (0.3 + rand) * 6
  end

  def dead?
    @age > @maximum_age
  end

  def format_height
    "#{(@height/12).to_i} feet and #{(@height%12).to_i} inches"
  end

end

class AppleTree < Tree
  attr_accessor :lifetime_apples
  @@colors = ['speckled green', 'yellow', 'rosy', 'bright red']

  def initialize
    super
    @apples = []
    @lifetime_apples = 0
  end

  def age!
    super
    add_apples if add_apples?
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
  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.format_height} tall"

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

    num_apples = basket.size
    avg_diameter = diameter_sum / num_apples
    tree.lifetime_apples += num_apples

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.format_height}"
    puts "Harvest:     #{num_apples} apples with an average diameter of #{avg_diameter.round(2)} inches"
    puts ""

    # Ages the tree another year
    tree.age!
    
  end

  puts "Alas, the tree, she is dead!"
  puts "She died after #{tree.age - 1} years at a height of #{tree.format_height},\
 with a lifetime production of #{tree.lifetime_apples} apples."

end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
tree_data