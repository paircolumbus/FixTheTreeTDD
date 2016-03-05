require 'rspec'
require 'tree'

describe "Tree" do

  before :each do
    @tree = Tree.new
  end


  it "should be a Class" do
    expect(Tree).to be_a Class
  end

  it "class includes the AppleTree module" do
    expect { @tree.add_apples }.to_not raise_error
  end

  describe "#new" do

    it "returns a new Tree object" do
      expect(@tree).to be_an_instance_of(Tree)
    end

    it "is instantiated with 4 instance variables" do
      expect(@tree.instance_variable_defined?(:@height)).to be true
      expect(@tree.instance_variable_defined?(:@age)).to be true
      expect(@tree.instance_variable_defined?(:@apples)).to be true
      expect(@tree.instance_variable_defined?(:@alive)).to be true
    end

  end


  describe "#age!" do

    it "ages the tree object one year per call" do
      10.times { @tree.age! }
      expect(@tree.age).to eq(10)
    end

    it "adds apples to the tree when the tree is 5 years old" do
        5.times { @tree.age! }
        expect(@tree.apples.size).to_not be 0
    end

    it "grows the tree 1 foot per year" do
      10.times { @tree.age! }
      expect(@tree.height).to eq(10)
    end

    it "stops growing the tree when reaching a height of 30 feet" do
      40.times { @tree.age! }
      expect(@tree.height).to eq(30)
    end

    it "sets @alive to false if the tree reaches 100 years old" do
      if @tree.age >= 150
      expect(@tree.alive).to be false
      end
    end

  end

  describe "#dead?" do

    it "evaluates to true when @alive evaluates to false" do
      150.times { @tree.age! }
      expect(@tree.dead?).to be true
    end

  end

end

describe "AppleTree" do

  before :each do
    @tree = Tree.new
    @tree.add_apples
  end

  it "should be a module" do
    expect(AppleTree).to be_a Module
  end

  describe "#add_apples" do
    it "populates @apples with 100 -250 valid apple objects when @age >= 5" do
      5.times { @tree.age! }
      if @tree.age >= 5
        expect(100..250).to cover(@tree.apples.size)
      end
    end
  end

  describe "#any_apples" do
    it "returns true if @apples array is not empty, otherwise return false" do
      if @tree.apples.empty? == true
        expect(@tree.apples.size).to eq(0)
      end
    end
  end

  describe "#pick_an_apple!" do
    it "should raise an error if there are no apples" do
      expect { @tree.pick_an_apple! }.to raise_error("This tree has no apples")
    end
  end

end


describe "Fruit" do

  it 'should be a Class' do
    expect(Fruit).to be_a Class
  end

end

describe 'Apple' do

  before :each do
    @apple = Apple.new("red", (rand(3..5)))
  end
  
  it 'should be a Class' do
    expect(Apple).to be_a Class
  end

  it "should be initialized with 2 instance variables" do
      expect(@apple.instance_variable_defined?(:@color)).to be true
      expect(@apple.instance_variable_defined?(:@diameter)).to be true
  end

  it "creates an apple with a diameter between 3 and 5" do
      expect(3..5).to cover(@apple.diameter)
    end

    it "gives the apples in the array a color" do
      expect(@apple.color).to be_a String
    end

end