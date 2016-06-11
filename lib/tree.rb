class NoApplesError < StandardError; end

class AppleTree
  attr_reader :height, :age, :apples, :alive

  def initialize
  end

  def age!
  end

  def add_apples
  end

  def any_apples?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
  end

  def dead?
  end
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple <
  attr_reader :color, :diameter

  def initialize(color, diameter)
  end
end

def avg(nums)
  nums.reduce(:+) / nums.size.to_f
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

    avg_diameter = avg basket.map { |apple| apple.diameter }

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

