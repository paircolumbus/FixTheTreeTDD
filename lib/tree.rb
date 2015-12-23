class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive
  MAX_AGE = 100
  MAX_DIAMETER = 12

  def initialize
      @height = 0.7
      @age = 0
      @apples = []
      
  end

  def age!
      @age += 1
      height!
      add_apples
  end
  
  def height!
      @height += (0.4 + rand) * 5 unless height >= 50 #ft
  end
  
  def dead?
      @age > MAX_AGE
  end
  
  def add_apples
      rand(@age / 2...@age).times do
          @apples.push(Apple.new('green' || 'red', rand(MAX_DIAMETER)))
      end
  end

def any_apples?
    @apples.length > 0
end
end



class AppleTree < Tree
    attr_accessor :all_apples
    @@colors = ['green', 'red']

  def initialize
      super
      @apples = []
      @all_apples = 0
    end
  def age!
      super
      add_apples if add_apples?
    end
 
  def add_apples?
      @age >= 3
    end
      

  
  def pick_an_apple!
      raise NoApplesError, "This tree has no apples" unless self.any_apples?
      @apples.pop
  end
end

class Fruit
  def seedy
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
  tree = AppleTree.new

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

    num_apples = basket.size
    avg_diameter = diameter_sum / basket.size

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches,"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
  
end
  


# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
#tree_data
