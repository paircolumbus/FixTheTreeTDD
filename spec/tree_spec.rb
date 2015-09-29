require 'rspec'
require 'tree'

describe Tree do

  let(:tree){Tree.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  context "when initialized" do

    it "gives the default height" do
      expect(tree.height).to eq(0)
    end

    it "gives the default age" do
      expect(tree.age).to eq(0)
    end

    it "has no apples at the begining" do
      expect(tree.any_apples?).to be false
    end

    it "is alive by default" do
      expect(tree.dead?).to be false
    end

  end


end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end
