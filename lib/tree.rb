class NoApplesError < StandardError; end

module AppleTree
  
  # adds apples when @apples == true, creates an array of 100 - 250 apples, diameter between 3 and 5 
  def add_apples
    @apples = Array.new(rand(100..250)) { Apple.new("red", (rand(3.0..5.0))) }
  end

  # boolean value, checks if tree is empty 
  def any_apples?
    if self.apples.nil? == true || self.apples.empty? == true 
      false
    else
      true
    end
  end

  # removes an apple from apple array which will be added to basket array, if [] is empty?, any_apples? == false, 
  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.any_apples?
    self.apples.pop
  end
  
end

class Tree

  include AppleTree

  attr_accessor :height, :age, :apples, :alive
  
  def initialize
    @height = 0
    @age = 0
    @apples = nil
    @alive = true
  end

  def age!
    @age += 1
    if @age >= 5
      @apples = self.add_apples
    end

    @height += 1 unless @height == 30

    if @age > 150
      @alive = false
    end
  end

  # returns true when @alive == false
  def dead?
    if @alive == false
      true
    else
      false
    end
  end


end


class Apple 
  attr_reader :color, :diameter 

  # creates new apple of a color and diameter, diameter based on age of tree
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

    avg_diameter = ((basket.map { |apple| apple.diameter }).reduce(:+) / basket.size).to_f.round(2)
 
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
tree_data
