class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @age = 0
    @height = 0
    @apples = []
    @alive = true
  end

  def age!
    @age = @age + 1
    @height = @height + 10
    if age > 2
      add_apples!
    end
    if age > 5
      @alive = false
    end
  end

  def add_apples!
    i = 0
    until i > 6 + Random.rand(4)
      @apples.push(Apple.new('Red', 3 + Random.rand(2))) 
      i = i + 1
    end
  end

  def any_apples?
    return !apples.empty?
  end

  def pick_an_apple
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    return @apples.pop
  end

  def dead?
    return !@alive
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
    avg_diameter = 0
    if tree.age > 2
      avg_diameter = diameter_sum/basket.count  # It's up to you to calculate the average diameter for this harvest.
    end 

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
