require 'rspec'
require 'tree'

describe 'Tree' do

  let(:tree) { Tree.new }

  it 'should be a Class' do
    expect(described_class).to eq(Tree)
  end

  describe "#initialize" do
  	it "generates a living tree" do
  		expect(tree.alive).to eq(true)
  	end
  end

  describe "#age!" do
  	it "ages the tree one year" do
  		age = tree.age

  		tree.age!

  		expect(tree.age).to eq(age + 1)
  	end

  	it "increases tree height by 1 foot" do
  		height = tree.height

  		tree.age!

  		expect(tree.height).to eq(height +1)
  	end

  	context "When the tree is less than or equal to 5 years old" do
  		it "does not add apples" do
  			3.times {tree.age!}

  			expect(tree.apples).to be_empty
  		end
  	end

  	context "When the tree is older than 5 years" do
  		it "adds apples" do
  			6.times {tree.age!}

  			expect(tree.apples).not_to be_empty
  		end
  	end
  end

  describe "#add_apples" do
  	it "adds between 1 and 6 apples to the tree" do
        apples = tree.apples.count
        tree.add_apples

        expect(tree.apples.count).to be_between(apples + 1, apples +6)
    end
  end

  describe '#any_apples?' do
        it "returns true if the tree has apples" do
            tree.add_apples

            expect(tree.any_apples?).to eq(true)
        end

        it "returns false if tree has no apples" do
            expect(tree.any_apples?).to eq(false)
        end
    end

    describe "#pick_an_apple!" do
        it "throws a NoApplesError when there are no apples" do
            expect{tree.pick_an_apple!}.to raise_error(NoApplesError) #this block didn't work without braces
        end

        it "removes an apple from the tree" do
            tree.add_apples
            apples = tree.apples.count
            tree.pick_an_apple!

            expect(tree.apples.count).to eq(apples - 1)
        end
    end

    describe '#dead?' do
        it "returns false if the tree is alive" do
            expect(tree.dead?).to eq(false)
        end

        it "returns true if the tree is older than 30" do
            31.times do
                tree.age!
            end

            expect(tree.dead?).to eq(true)

        end
    end
end

describe Fruit do
    let(:fruit) { Fruit.new }

    it 'should be a Class' do
        expect(described_class).to eq(Fruit)
    end

    describe '#initialize' do
        it 'will generate a fruit with seeds' do
            expect(fruit.has_seeds).to eq(true)
        end
    end
end

describe Apple do
    let(:apple) { Apple.new }

    it 'should be a Class' do
        expect(described_class).to eq(Apple)
    end

    describe "#color" do
    	it "returns the apple's color" do
    		expect(apple.color).to be_kind_of(String)
    	end
    end 

    describe "#diameter" do
    	it "returns the apple's color" do
    		expect(apple.diameter).to be_kind_of(Float)
    	end
    end 
end
