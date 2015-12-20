require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? 'Class').to be_true
  end
end

describe Fruit do
    it 'should be a class' do
      expect(described_class.is_a? 'Class').to be_true
    end
end

describe Apple do
    it 'should be a subclss of Fruit' do
        expect(described_class.ancestors).to include Fruit #expecting Apple to be a subclass of Fruit
    end
end
