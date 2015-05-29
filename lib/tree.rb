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
      @alive = false
    else
      @alive = true
    end
    !@alive
  end
end


class AppleTree < Tree

  attr_accessor :number_of_apples
  
  def initialize
    super
    @number_of_apples = 0
    @bearing_fruit = false
  end

  def age!
    @age += 1
    @number_of_apples = @age * rand(1..4)
    if @age == 5
      @bearing_fruit = true
    end
    if self.dead?
      @bearing_fruit = false
    end
  end

  def any_apples?
    if @bearing_fruit && @alive && @number_of_apples > 0
      true
    else
      false
    end
  end

  def pick_an_apple!  
    raise NoApplesError, "There aren't any apples" unless self.any_apples?
    if any_apples?
      @number_of_apples -= 1
      Apple.new()
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
  attr_accessor :apples

  def initialize
    @apples = []
  end

  def size
    @apples.count
  end

  def avg_diameter
    total = 0
    if (self.size) > 0
      @apples.each do |a|
        total += a.diameter
      end
      (total/self.size).round(1)
    else
      total
    end
  end
end


def tree_data
  tree = AppleTree.new
  
  tree.age! until tree.any_apples?
  puts 'Number of apples', tree.number_of_apples
  puts "The tree is #{tree.age} years old and #{tree.height} feet tall."
  puts "It has #{tree.number_of_apples} apples the first year."
  
  until tree.dead?
    basket = Basket.new

    # It places the apple in the basket
    while tree.any_apples?
      basket.apples << tree.pick_an_apple!
    end

    puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{basket.avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

tree_data
