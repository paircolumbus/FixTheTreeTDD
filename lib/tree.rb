class NoApplesError < StandardError; end
class Tree
  attr_reader :height, :age, :alive

  def initialize(history)
    @history = history
  end
end

class AppleTree < Tree
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
  attr_reader :has_seeds

  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

  def initialize(color, diameter)
    @color = color
    @diameter = diameter
  end
end

def avg(nums)
  nums.reduce(:+) / nums.size.to_f
end

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

