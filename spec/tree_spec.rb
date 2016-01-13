require "rspec"
require "tree"

describe Tree do
  let(:tree) { Tree.new }

  it "should be a Class" do
    expect(described_class.is_a? Class).to be true
  end

  context "when tree is starting" do
    it "should not have age" do
      expect(tree.age).to eq(0)
    end

    it "should not have height" do
      expect(tree.age).to eq(0)
    end

    it "should not have apples" do
      expect(tree.any_apples?).to be false
    end

    it "should be alive" do
      expect(tree.dead?).to be false
    end
  end

  context "when tree is maturing" do
    it "should age" do
      starting_age = tree.age
      tree.age!
      expect(tree.age - starting_age).to be > 0
    end

    it "should increase height" do
      starting_height = tree.height
      tree.age!
      expect(tree.height - starting_height).to be > 0
    end

    it "should stop increasing height after 5 years" do
      5.times { tree.age! }
      height_after_5_years = tree.height
      tree.age!
      expect(tree.height).to eq(height_after_5_years)
    end

    it "should produce apples after 5 years" do
      4.times { tree.age! }
      expect(tree.any_apples?).to be false
      tree.age!
      expect(tree.any_apples?).to be true
    end

    it "should not allow picking without apples" do
      expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
    end

    it "should not have apples after being picked" do
      5.times { tree.age! }
      while tree.any_apples?
        tree.pick_an_apple!
      end
      expect(tree.any_apples?).to be false
    end
  end

  context "when tree is dying" do
    it "should be dead after 30 years" do
      29.times { tree.age! }
      expect(tree.dead?).to be false
      tree.age!
      expect(tree.dead?).to be true
    end

    it "should not have apples" do
      30.times { tree.age! }
      expect(tree.any_apples?).to be false
    end
  end
end

describe Fruit do
  let(:fruit) { Fruit.new }

  it "should be a Class" do
    expect(described_class.is_a? Class).to be true
  end

  it "should initialize parameters" do
    expect(fruit.has_seeds).to be true
  end
end

describe Apple do
  COLOR = "green"
  DIAMETER = 3

  let(:apple) { Apple.new(COLOR, DIAMETER) }

  it "should be a Class" do
    expect(described_class.is_a? Class).to be true
    expect(apple.is_a? Fruit).to be true
    expect(apple.is_a? Apple).to be true
  end

  it "should initialize parameters" do
    expect(apple.color).to eq(COLOR)
    expect(apple.diameter).to eq(DIAMETER)
    expect(apple.has_seeds).to be true
  end
end