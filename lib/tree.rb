class NoApplesError < StandardError; end



class AppleTree
  attr_reader :height, :age, :apples, :alive

  def initialize(height, age, apples, alive)
    @height = height
    @age = age
    @apples = apples
    @alive = alive
  end

  def age!
    @age = @age + 1
    @height = @height + Random.new.rand(0.5..2.5)
    self.add_apples
  end

  def add_apples
    rn = Random.new
    numApples = rn.rand(1..10)
    diameter = rn.rand(2.0..4.0)

    for i in 0..numApples
      apples.push(Apple.new("Red", diameter))
    end
  end

  def any_apples?
    if(@apples == nil || @apples.count <= 0)
      return false
    end
    return true;
  end

  def pick_an_apple!
    if(any_apples?)
      @apples.pop
    end
    # raise NoApplesError, "This tree has no apples" unless self.any_apples?
  end

  def dead?
    if(@age > 50)
      return true
    end
    return false
  end
end

class Tree < AppleTree

  def initialize
    super(0,0,[],true)
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

    avg_diameter = basket.count == 0 ? 0 : diameter_sum / basket.count  # It's up to you to calculate the average diameter for this harvest.

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
