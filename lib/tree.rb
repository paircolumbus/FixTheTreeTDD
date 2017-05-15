class NoApplesError < StandardError; end

class Tree

  attr_accessor(:height, :age, :alive) #fill_in :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @alive = true
  end

  def age!
    @age += 1
    if @age < 10
      @height += 2
    elsif @age < 20
      @height += 1
    end

    if @age >= 100
      @alive = false
    end
  end

  def dead?
    !@alive
  end
end

class AppleTree < Tree

  attr_accessor(:apples)

  def available_colors
    ["red", "yellow", "green"]
  end

  def new_diameter
    # diameter in inches
    3 + rand(3)
  end

  def initialize
    super
    @apples = []
  end

  def age!
    super
    add_apples if @alive && @age > 10
  end

  def add_apples
    (0..(1+rand(5))).each do
      @apples.push(Apple.new(available_colors.sample, new_diameter))
    end
  end

  def any_apples?
    @apples.any?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    return @apples.pop
  end

end

class Fruit
  attr_reader :has_seeds

  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :diameter, :color

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
#tree_data
