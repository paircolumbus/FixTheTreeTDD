class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize (height =0, age =0, apples =[], alive =true)
    @height = height
    @age = age
    @apples = apples
    @alive =true
  end

  # Ages the tree by a year, and increments the height of the tree by a random value
  # Adds the apples to the tree when it matures( at age 10)
  # Kills the tree at a certain age (i.e 100)
  def age!
    @age +=1
    @height += rand(0..5)
    if @age>=10
      add_apples(rand(1..50))
    end
    if @age==100
      @alive = false
      @apples = []
    end
  end

  #Adds the given amount of apples to the tree with a random color and diameter
  def add_apples(count)
    count.times{
      @apples << Apple.new(['red','green'].sample,rand(5..15))
      }
  end

  def any_apples?
    @apples.length > 0
  end

  #Throws an exception if tree has no apples else removes an apple from the tree
  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples.pop
  end


  def dead?
    not @alive
  end
end

class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :color, :diameter

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

    #calculate avg diameter of the apples in basket
    if diameter_sum > 0
      avg_diameter = diameter_sum / basket.length
    else
      avg_diameter = 0
    end

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
