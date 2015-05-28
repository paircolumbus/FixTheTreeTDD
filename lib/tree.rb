class NoApplesError < StandardError; end

class Tree

  attr_accessor :age, :height, :alive

  def initialize
    @age = 0
    @height = 0
    @alive = true
  end

  def age!
    @age += 1
  end

  def height
    if @age < 30
      @height = @age
    else
      @height = 30
    end
  end

  def dead?
    if @age > 100
      @alive = true
    else
      @alive = false
    end
  end
end

class AppleTree < Tree

  attr_accessor :apples

  def initialize
    super
    @apples = []
  end
  

  def add_apple
  end

  def any_apples?
    if @age >= 5 && @alive
      true
    else
      false
    end
  end

  def pick_an_apple!  
    raise NoApplesError, "There aren't any apples" unless self.any_apples?
    if any_apples?
      puts "I picked an apple"
      add_apple
    end
  end

end

class Fruit
  attr_accessor :color, :diameter 

  def initialize(color: 'orange', diameter: 3)
    @color = color
    @diameter = diameter
  end

  def has_seeds?
    true
  end
end

class Apple < Fruit 
  attr_reader :color, :diameter

  def initialize
    super
    colors = ['red', 'yellow', 'green']
    @color = colors.sample
    @diameter = rand(2.5..3.25)
  end 
end

class Basket
  attr_accessor :diameter_array, :size

  def initialize(diameter_array)
    @diameter_array = diameter_array
    @size = @diameter_array.count
  end

  def avg_diameter
    if size > 0
      avg = (@diameter_array.reduce(:+)/diameter_array.count).round(1)
    else
      avg = 0
    end
    avg
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = AppleTree.new
  
  tree.age! until tree.any_apple?
  
  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apple?
      basket << tree.pick_an_apple!
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

# tree_data
