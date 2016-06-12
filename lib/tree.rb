class NoApplesError < StandardError; end
class Tree
  attr_reader :height, :age, :alive

  def initialize(history)
    @history = history
    @age = 0
    @height = 0
    @alive = true
  end

  def age!
    @age += 1
    if @age > @history.life_span then
      @alive = false
    else
      @height = @history.get_year(@age).height
    end

  end

  def dead?
    !@alive
  end
end

class AppleTree < Tree
  attr_reader :height, :age, :apples, :alive

  def initialize(color, history)
    super(history)
    @color = color
    @apples = []
  end

  def age!
    super

    year = @history.get_year(@age)

    if year != nil then
      apples = year.apples.map { |apple_size| Apple.new(@color, apple_size) }
      add_apples(apples)
    end
  end

  def add_apples(apples)
    @apples += apples
  end

  def any_apples?
    @apples != nil and @apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?

    @apples.shift()
  end

  def pick_all_apples!
    @apples = []
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

class Utils
  def avg(nums)
    nums.reduce(:+) / nums.size.to_f
  end

  def tree_data(tree_details)
    tree = AppleTree.new("n/a", tree_details)

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
end

