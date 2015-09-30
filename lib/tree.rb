class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive
  MATURE_YEAR = 5
  DEATH_YEAR = 200
  MAX_FRUIT = 30
  MAX_DIAMETER = 5

  def initialize
    @height = 0
    @age = 0
    @apples = 0
    @alive = true
  end

  def age!
    @age += 1
    @height += 1
    if(age >= MATURE_YEAR)
      add_apples
    end
    if(age >= DEATH_YEAR)
      @alive = false
    end
  end


  def add_apples
    @apples += rand(MAX_FRUIT) + 1
  end

  def any_apples?
    @apples > 0
  end


  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples -= 1
    Apple.new((rand(2)%2 == 0)?'red':'yellow', rand(MAX_DIAMETER) + 1)
  end

  def dead?
    ! @alive
  end
end

class Fruit

  attr_reader :has_seeds
  alias_method :has_seeds?, :has_seeds

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

    avg_diameter = diameter_sum / basket.count

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
#tree_data
