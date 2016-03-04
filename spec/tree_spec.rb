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

    it "adds apples to the tree when the tree is old enough" do
      if @tree.age >= 5
        expect(@tree.apples).to be true
      end
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
    it "creates an array of 100 -250 apple objects, called 'harvest', when @apples == true" do
      @tree.add_apples
      expect(@tree.apples).to be_a Array
    end

    it "gives the apples in the array a diamter between 3 and 5" do
    end

    it "gives the apples in the array a color" do
    end

  end



end


describe "Fruit" do

  it 'should be a Class' do
    expect(Fruit).to be_a Class
  end

end

describe 'Apple' do

  it 'should be a Class' do
    expect(Apple).to be_a Class
  end

end