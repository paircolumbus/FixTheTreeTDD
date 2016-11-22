require 'rspec'
require 'tree'

describe Tree do
    let(:tree) { Tree.new }
    # look into rspec style guide
    # look up relish

    it 'will be a Class' do
        expect(described_class).to eq(Tree)
    end

    describe "#initialize" do
        it "will generate a living tree" do
            expect(tree.alive).to eq(true) # ask about be_true
        end
    end

    describe "#age!" do
        it "will age the tree by 1 year" do
            age = tree.age

            tree.age!

            expect(tree.age).to eq(age + 1)
        end

        it "will increase the height by 5 to 10 feet" do
            height = tree.height

            tree.age!

            expect(tree.height).to be_between(height + 5, height + 10)
        end

        it "will add 1 to 6 apples" do
            apples_count = tree.apples.count

            tree.age!

            expect(tree.apples.count).to be_between(apples_count + 1, apples_count + 6)
        end

        it "will eventually die" do
            tree.age_max.times do
                tree.age!
            end

            expect(tree.alive).to eq(false)
        end
    end

    describe "#add_apples!" do
        it "adds between 1 and 6 apples to the tree" do
            apples_count = tree.apples.count

            tree.add_apples!

            expect(tree.apples.count).to be_between(apples_count + 1, apples_count + 6)
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
            expect{ tree.pick_an_apple! }.to raise_error(NoApplesError) # this block didn't work without braces, need to look further into this
        end

        it "removes an apple from the tree" do
            tree.add_apples

            apples_count = tree.apples.count

            tree.pick_an_apple!

            expect(tree.apples.count).to eq(apples_count - 1)
        end
    end

    describe '#dead?' do
        it "returns false if the tree is alive" do
            expect(tree.dead?).to eq(false)
        end

        it "returns true if the tree is dead" do
            tree.age_max.times do
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
    let(:apple) { Apple.new("red", 5) }

    it 'should be a Class' do
        expect(described_class).to eq(Apple)
    end

    describe '#initialize' do
        it 'creates an apple of the specified color and diameter' do
            expect(apple.color).to eq("red")
            expect(apple.diameter).to eq(5)
        end

        it 'throws an argument error when not given the correct number of arguments' do
            expect{ Apple.new }.to raise_error(ArgumentError)
            expect{ Apple.new("red") }.to raise_error(ArgumentError)
            expect{ Apple.new(5) }.to raise_error(ArgumentError)
        end
    end
end
