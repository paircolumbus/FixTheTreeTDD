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

    it "get apple should return an error when no apples available" do
      expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
    end

  end

  context "when aging first years" do

    before {
      5 * tree.age!
    }

    it "increases its height" do
      expect(tree.height).to be > 0
    end

    it "gets older" do
      expect(tree.age).to be > 0
    end

    it "has no apples" do
      expect(tree.any_apples?).to be false
    end

    it "is alive" do
      expect(tree.dead?).to be false
    end

  end

  context "when getting apples" do

    before {
      tree.add_apples
    }


    it "has some apples" do
      expect(tree.any_apples?).to be true
    end

    it "get apple should return an apple fruit" do
      expected_apples = tree.apples - 1
      expect(tree.pick_an_apple!.is_a? Apple).to be true
      expect(tree.apples == expected_apples).to be true

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
