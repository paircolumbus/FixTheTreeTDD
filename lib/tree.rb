class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  @color_prng = Random.new
  @diameter_prng = Random.new

  def initialize
    @height = 10
    @age = 1
    @apples = []
    @alive = true
    @prng = Random.new
    @colors = ["brown", "blue", "orange", "black", "green", "red", "yellow"]
    @color_prng = Random.new
    @diameter_prng = Random.new
  end

  def age!
    @apples = []
    if @age == 60
      @alive = false
      return
    end
    @age += 1
    @height *= 2.2
    add_apples
  end

  def add_apples
    @prng.rand(10).times{ @apples.push(Apple.new(@colors[@color_prng.rand(6)], @diameter_prng.rand(10))) }
  end

  def any_apples?
    @apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no oranges -> #{@apples}" unless self.any_apples?
    @apples.pop
  end

  def dead?
    @alive ? false : true
  end
end

class Fruit
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

    begin 
      avg_diameter = diameter_sum / basket.size# It's up to you to calculate the average diameter for this harvest.
    rescue ZeroDivisionError
      avg_diameter = 0
    end

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

tree_data
