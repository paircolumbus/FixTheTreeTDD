require 'rspec'
require 'tree'

describe Tree do
  let(:apple_face) {Tree.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  describe 'age!' do
    it 'should increment the age of the Tree by 1' do
      apple_face.age!
      expect(apple_face.age).to eq(1)
    end
  end
end

describe 'Fruit' do
end

describe Apple do
  it 'should be a subclass of Fruit' do
    expect(described_class.ancestors).to include Fruit
  end
end

