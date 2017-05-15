class NoApplesError < StandardError; end

class Tree
    attr_reader :height, :age, :age_max, :apples, :alive

    def initialize
        @age = 0
        @age_max = Random.rand(50..100)
        @alive = true
        @apples = []
        @height = 0
    end

    def age!
        @age += 1

        unless @age >= @age_max
            @height += Random.rand(5..10)
            add_apples
        else
            @alive = false
        end
    end

    def add_apples
        Random.rand(1..6).times {
            @apples.push(Apple.new("red", Random.rand(1..6)))
        }
    end

    def any_apples?
        @apples.count > 0
    end

    def pick_an_apple!
        raise NoApplesError, "This tree has no apples" unless self.any_apples?

        @apples.pop
    end

    def dead?
        !@alive
    end
end

class Fruit
    attr_reader :has_seeds

    def initialize
        @has_seeds = true
    end
end

class Apple < Fruit
    attr_reader :color, :diameter #what should go here

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

    avg_diameter = diameter_sum / basket.size # It's up to you to calculate the average diameter for this harvest.

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
