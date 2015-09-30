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
      4.times{tree.age!}
    }

    it "increases its height" do
      expect(tree.height).to  be > 0
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

  context "tree gets apples each year starting at age 5" do
    before {
      5.times{tree.age!}
    }

    it "has some apples" do
      expect(tree.any_apples?).to be true
    end

  end

  context "tree dies at 200 years" do
    before {
      201.times{tree.age!}
    }

    it "has some apples" do
      expect(tree.dead?).to be true
    end

  end

end

describe Fruit do

  let(:fruit){Fruit.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds?).to be true
  end
end

describe Apple do

  expectedColor = 'yellow'
  expectedDiameter = 2
  let(:apple){Apple.new(expectedColor, expectedDiameter)}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should be an Apple and a Fruit' do
    expect(apple.is_a? Apple).to be true
    expect(apple.is_a? Fruit).to be true
  end

  it 'should have attributes initialized' do
    expect(apple.color).to eq(expectedColor)
    expect(apple.diameter).to eq(expectedDiameter)
    expect(apple.has_seeds?).to be true
  end

end
