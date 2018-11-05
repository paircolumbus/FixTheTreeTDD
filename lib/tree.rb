class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = true
  end

  def age!
    case @age
    when 0...5
      @age += 1
      @height += rand(1.5...2.5)
    when 5...10
      @age += 1
      @height += rand(0.5...1.0)
      add_apples
    when 10...15
      @age += 1
      @height += rand (0.1...0.5)
      add_apples
    else
      @alive = false
    end
  end

  def add_apples
    rand(1..500).times do
    @apples << Apple.new('Green', rand(2.01..3.01))
    end
  end

  def any_apples?
    @apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless any_apples?
    @apples.delete_at(rand(@apples.length))
  end

  def dead?
    !@alive
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

    basket.each do |apple| #method invocation with a block
      diameter_sum += apple.diameter
    end

    avg_diameter = diameter_sum/basket.length #sum of diameters/total number of apples

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height.round(2)} feet"
    puts "Harvest:     #{basket.size.round(2)} apples with an average diameter of #{avg_diameter.round(2)} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

tree_data
