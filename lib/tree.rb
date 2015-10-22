class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age
  MAXIMUM_AGE = 100
  MAXIMUM_FRUIT_DIAMETER = 10

  def initialize
    @height = 0.5
    @age = 0
    @apples = []
  end

  def age!
    @age += 1
    @height += 0.5 unless height >= 30
    add_apples
  end

  def add_apples
    if age >= 3
      rand(age / 2...age).times do
        @apples.push(Apple.new('red', rand(MAXIMUM_FRUIT_DIAMETER)))
      end
    end
  end

  def any_apples?
    @apples.any?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end

  def dead?
    age >= MAXIMUM_AGE
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

    avg_diameter = diameter_sum / basket.length

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
