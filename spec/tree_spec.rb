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
end

describe Fruit do
    it 'should be a Class' do
        expect(described_class.is_a?(Class)).to be true
    end
end

describe Apple do
    it 'should be a Class' do
        expect(described_class.is_a?(Class)).to be true
    end
end
