class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :alive

  def initialize
    @height = 0
    @age = 0
    @alive = true
  end

  def age!
    @age += 1
  end

  def dead?
    !@alive
  end
end

class AppleTree < Tree
  attr_reader :apples

  def initialize
    super

    @apples = []
  end

  def age!
    super

    case @age
    when 0..5
      @height += 1
    when 6..10
      add_apples
    when 11
      # almost dead, do nothing
    else
      @alive = false
    end
  end

  def add_apples
    # each year, grows 0-10 apples
    rand(10).times do
      @apples.push(Apple.new('red', 1+rand(5)))
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

    avg_diameter = basket.empty? ? 0 : diameter_sum / basket.size

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

tree_data
