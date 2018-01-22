class NoFruitError < StandardError; end

class Tree
  attr_#fill_in :height, :age, :alive, :fruit

  def initialize
  end

  def age!
  end

  def dead?
  end

  def add_fruit
  end

  def any_fruit?
  end

  def pick_fruit!
    raise NoFruitError, "This tree has no fruit" unless self.any_fruit?
  end
end

class AppleTree <
  #what should go here if anything?
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple <
  attr_reader #what should go here?

  def initialize(color, diameter)
  end
end

#THERE SHOULD ONLY BE TWO THINGS YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = AppleTree.new

  tree.age! until tree.any_fruit?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the fruit in the basket
    while tree.any_fruit?
      basket << tree.pick_fruit!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
    end

    avg_diameter = # It's up to you to calculate the average diameter for this harvest.

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
