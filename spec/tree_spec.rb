require 'rspec'
require 'tree'

describe Tree do
    
    it 'should be a Class' do
        expect(described_class.is_a? Class).to be true
    end

    it 'should be a newborn when planted' do
        tree = Tree.new

        expect(tree.age).to eq 0
    end

    it 'should have zero apples when planted' do
        tree = Tree.new

        expect(tree.any_apples?).to eq false
    end

    it 'should be alive when planted' do
        tree = Tree.new

        expect(tree.dead?).to eq false
    end

    it 'should age a year' do
        tree = Tree.new
        tree.age!

        expect(tree.age).to eq 1
    end

    it 'should die after 50 years' do
        tree = Tree.new
        50.times do tree.age! end

        expect(tree.dead?).to eq true
    end

    it 'should add at least one apple each times it ages' do
        tree = Tree.new
        startApples = tree.apples.count
        tree.age!
        endApples = tree.apples.count

        expect(endApples).to be > startApples
    end

    it 'should decrease by one apple when an apple is picked' do
        tree = Tree.new
        tree.age!
        startApples = tree.apples.count
        tree.pick_an_apple!
        endApples = tree.apples.count

        expect(endApples).to eq (startApples-1)
    end

    it 'should give an apple when one is picked' do
        tree = Tree.new
        tree.age!
        apple = tree.pick_an_apple!

        expect(apple).to be_instance_of(Apple)
    end

    it 'should grow a positive value each year' do
        tree = Tree.new
        startHeight = tree.height
        tree.age!
        endHeight = tree.height
        
        expect(endHeight).to be > startHeight
    end
end

describe Fruit do
    it 'should be a Class' do
        expect(described_class.is_a?(Class)).to be true
    end

    it 'should have seeds' do
        fruit = Fruit.new
        expect(fruit.has_seeds).to eq true
    end
end

describe Apple do
    it 'should be a Class' do
        expect(described_class.is_a?(Class)).to be true
    end

    it 'should set the color and diameter properties' do
        color = "blue"
        diameter = 25.3
        apple = Apple.new(color, diameter)
        expect(apple.color).to eq color
        expect(apple.diameter).to eq diameter
    end
end
