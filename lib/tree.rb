class NoApplesError < StandardError; end

class Tree
  attr_accessor :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @apples = []
    @alive = true
  end
  
  def age!
    if @age == 100
      @alive = false
      @apples = []
    else

      #Grow really rapidly when it's young, but grows at a slower rate
      #as it gets older.  It stops growing altogether at a certain point.
      #The tree starts growing fruit at a certain point, but continues
      #growing fruit until it dies.
      case @age

      #Note: .. for ranges is inclusive for both values; ... for ranges means we exclude the end value
      when (0...5)
        @height = @height + 2.5
      when (5...10)
        @height = @height + 2
        rand(75..100).times { add_apple }
      when (10...15)
        @height = @height + 1.5
        rand(150..250).times { add_apple }
      when (15...25)
        @height = @height + 1
        rand(250..500).times { add_apple }
      when (25...50)
        @height = @height + 0.5
        rand(150..250).times { add_apple }
      else
        rand(75..100).times { add_apple }
      end

      #Finally, age the tree
      @age = @age + 1
    end
  end

  def add_apple
    #Never allow the apple tree to have more than 1000 apples
    if @apples.length < 1000
      @apples << Apple.new("Red", rand(5..10))
    end
  end

  def any_apples?
    return true if @apples.length > 0
    false
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    return @apples.pop
  end

  def dead?
    @alive ? false : true
  end
end

class Fruit
  attr_accessor :has_seeds
  def initialize
    @has_seeds = true
  end
end

class Apple < Fruit
  attr_accessor :color, :diameter

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

    avg_diameter = (diameter_sum.to_f / basket.length).round(2)

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
