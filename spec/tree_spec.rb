require 'rspec'
require 'tree'
require 'pry'

describe 'Tree' do
	let(:described_class) { Tree.class }
	let(:generic_tree) {Tree.new}

  it "should be a Class" do
    expect(described_class).to be_a(Class)
  end

  describe "#age!" do 
  	it "increments the tree's age by 1" do
  		expect { generic_tree.age! }.to change{ generic_tree.age }.by(1)
  	end 

  	it "kills the tree when it has reached max age" do 
  		200.times { generic_tree.age! }
  			expect(generic_tree.dead?).to eq true 
  	end
  end

  describe "#height" do 
  	it "returns the tree's height as an integer" do 
  		expect(generic_tree.height).to be_a(Integer)
  	end 
  end  

  context "is alive" do 
  	describe "#alive" do 
  		it "returns the tree's life status as a boolean" do
  			expect(generic_tree.alive).to eq true  
  		end 
  	end 

  	describe "#dead?" do
  		it "returns false if the tree is alive" do
  			expect(generic_tree.dead?).to eq false 
  		end 
  	end  
 end

  #contexts and before hooks? 
end

describe "AppleTree" do 
	let(:granny_smith_tree) { AppleTree.new }
	let(:grow_apples) {	20.times { granny_smith_tree.age! }
			granny_smith_tree.add_apples}

	it "is a kind of Tree" do 
		expect(granny_smith_tree).to be_a(Tree)
	end 

	describe 'AppleTree#dead?' do 
		it "inherits #dead from parent class and kills the tree when it's own max age" do 
			150.times { granny_smith_tree.age! }
			expect(granny_smith_tree.dead?).to eq true	
		end 
	end 

	describe '#add_apples' do 
		it "does not add apples when the tree is younger than fruit bearing age" do 
			granny_smith_tree.add_apples
			expect(granny_smith_tree.apples).to eq 0
		end 

		it "increases an apple tree's amount of apples by 40 when tree is old enough" do
			grow_apples
			expect(granny_smith_tree.apples).to eq 40
		end 
	end 

	describe '#any_apples?' do 
		it "returns a boolean according to a tree's amount of apples" do 
			expect(granny_smith_tree.any_apples?).to eq false
		end 
	end 

	describe '#pick_an_apple!' do 
		let(:shiny_apple) { granny_smith_tree.pick_an_apple! }
		before(:each) {grow_apples}

		it 'returns an Apple object' do 
			expect(shiny_apple).to be_a(Apple)
		end 

		it "decrements the number of apples by 1" do 
			expect{ granny_smith_tree.pick_an_apple! }.to change{ granny_smith_tree.apples }.by(-1)
		end 
	end 
end 

describe 'Fruit' do
	let(:mystery_fruit) { Fruit.new }

	it "has seeds" do 
		expect(mystery_fruit.has_seeds).to be true 
	end 
end

describe 'Apple' do
	let(:worm_apple_ew) { Apple.new("rotten brown") }

	it "has a diameter between 1 and 4" do 
		expect(worm_apple_ew.diameter).to be <= 4
	end 

	it "is red in color" do 
		expect(worm_apple_ew.color).to eq "rotten brown"
	end 
end
