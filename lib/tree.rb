class NoApplesError < StandardError; end

class Tree
  attr_reader :height, :age, :apples, :alive

  def initialize
    @height = 0
    @age = 0
    @apples = 0
    @alive = true
  end

  def age!
    return if ! @alive
    @age += 1
    @height += [*5...20].sample / 10.0
    @alive = @age < 6 ? true : (@age > 9 ? false : [true, true, false].sample)
    add_apples if @age > 3
  end

  def add_apples
    @apples += [*80...120].sample
  end

  def any_apples?
    @apples > 0
  end

  def any_apple? # (u.u)
    any_apples?
  end

  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    @apples -= 1
    return Apple.new
  end

  def dead?
    !@alive
  end
end

class Apple
  attr_reader :color, :diameter

  def initialize
    @color = ['red','yellow','green'].sample
    @diameter = [*2...5].sample * [*2...5].sample / 2.0
  end
end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new

  tree.age! until tree.any_apple?

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

    avg_diameter = diameter_sum / basket.length

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
