require 'rspec'
require 'tree'

describe Tree do
    let(:tree_aging) {Tree.new}
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
    end
  describe 'age!' do
      it 'should increase age by 1' do
        tree_aging.age!
        expect(tree_aging.age).to eq(1)
      end
    end
 end

describe Fruit do
    it 'should be a class'
      expect(described_class.is_a? 'Class').to be_true
    end
end

describe Apple do
    it 'should be a subclss of Fruit' do
        expect(described_class.ancestors).to include Fruit #expecting Apple to be a subclass of Fruit
    end
end
