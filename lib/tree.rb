class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize(height, age, apples, alive)
    @height = height
    @age = age 
    @apples = apples
    @alive = alive
  end

  def age!
    add_apples unless @age < 3
    @age += 1 
  end

  def add_apples
    rand(5..15).times { @apples.push(Apple.new) }
  end

  def any_apples?
    @apples.size > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.shift()
  end

  def dead?
    age > 10
  end
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize()
    @color = ['red','yellow', 'green'].sample
    @diameter = rand(5..10)
  end
end

def tree_data
  tree = Tree.new(5, 1, [], true)

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = diameter_sum/basket.size

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
# tree_data
