class NoApplesError < StandardError; end

class Tree
  attr_reader :height
  attr_reader :age
  attr_reader :apples
  attr_reader :alive
  attr_reader :treeAppleColor

  def initialize
      @age = 0
      @height = 1
      @apples = Array.new
      @alive = true
      @treeAppleColor = "Red"
  end

  def age!
      @age += 1

      self.add_apples
      self.grow

      if @age >= 50
          @alive = false
      end
  end

  def grow
      @height += Random.new.rand(1..10)
  end

  def add_apples
      numApples = Random.new.rand(1..20) * @height

      numApples.times do
          diameter = Random.new.rand(2.0..4.0)
          apple = Apple.new(@treeAppleColor, diameter)
          @apples << apple
      end
  end

  def any_apples?
      return @apples.count > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    
    apple = @apples.delete_at(rand(@apples.length))
    return apple
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
  attr_reader :color
  attr_reader :diameter

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

    avg_diameter = diameter_sum / basket.count.to_f

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
