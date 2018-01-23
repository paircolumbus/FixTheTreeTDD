class NoApplesError < StandardError; end
class DeadTreeError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize(height: 0, age: 0, apples: [], alive: true)
    @height = height
    @age = age
    @apples = apples
    @alive = alive
  end

  def age!
    raise DeadTreeError, "This tree is dead" if self.dead?
    @age += 1
    @height += 1 if @height < 25
    add_apples if @age > 5
    kill! if @age > 200
  end

  def add_apples
    raise DeadTreeError, "This tree is dead" if self.dead?
    rand(50..100).times { @apples << Apple.new(color: "red", diameter: rand(2..4)) }
  end

  def any_apples?
    @apples.count > 0
  end

  def pick_an_apple!
    raise DeadTreeError, "This tree is dead" if self.dead?
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.shift
  end

  def dead?
    !@alive
  end

  def kill!
    @alive = false
    @apples = []
  end
end

class Fruit
  attr_reader :has_seeds

  def initialize(has_seeds: true)
    @has_seeds = has_seeds
  end

  def has_seeds?
    @has_seeds
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color: "red", diameter: 3)
    super()

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

    avg_diameter = diameter_sum / basket.count

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
