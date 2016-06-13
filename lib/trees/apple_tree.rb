require_relative "tree"
require_relative "apple"

class NoApplesError < StandardError; end

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


