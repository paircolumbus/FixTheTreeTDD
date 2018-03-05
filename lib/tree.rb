class NoApplesError < StandardError; end
class DeadTreeError < StandardError; end

class Tree

  attr_reader :height
  attr_reader :age
  attr_reader :apples
  attr_accessor :alive

  def initialize(height = 0, age = 0, apples = [], alive = true)
    @height = height
    @age = age
    @apples = apples
    @alive = alive
  end

  def age!
    raise DeadTreeError, "This tree is dead" if self.dead?
    @age += 1

    # Simple check if a tree has become too old
    if @age >= 10
      @alive = false
    end

    # What to do when a tree is alive and is aging
    if @alive
      @height += 1
      add_apples
    end

  end

  def add_apples
    raise DeadTreeError, "This tree is dead" if self.dead?
    # Change this if you want to change how apples are added/removed
    count = @height
    count.times { @apples.push(Apple.new('red', 1)) }
  end

  def any_apples?
    @apples.size > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.shift
  end

  def dead?
    @alive == false
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

    avg_diameter = diameter_sum / basket.size.to_f # It's up to you to calculate the average diameter for this harvest.

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
