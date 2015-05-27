class NoApplesError < StandardError; end

class AppleTree
  attr_reader :height, :age, :apples

  def initialize
    @height = 0
    @age = 0
    @apples = []
  end

  def age!
    @apples = []
    unless dead?
      @height += rand(1..2)
      @age += 1
      add_apples if @age >= 5 && !dead?
    end
    @age
  end

  def dead?
    @age > 50
  end

  def add_apples
    (rand(5..10) * @height).times { @apples << Apple.new }
  end

  def any_apples?
    @apples.any?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.shift
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

  def initialize(color = :red, diameter = rand(4))
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

    avg_diameter = diameter_sum / basket.count.to_f

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# tree_data
