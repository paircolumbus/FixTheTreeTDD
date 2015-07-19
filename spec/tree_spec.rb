require 'rspec'
require 'tree'

describe AppleTree do

  context "when first created" do
    subject(:newAppleTree) { AppleTree.new }

    describe "#age" do
      it { expect(newAppleTree.age).to eq(0) }
    end

    describe "#apples" do
      it { expect(newAppleTree.apples).to eq([]) }
    end

    describe "#height" do
      it { expect(newAppleTree.height).to eq(0) }
    end
    
    describe "#pick_an_apple!" do
      it { expect { newAppleTree.pick_an_apple! }.to raise_error NoApplesError }
    end
  end

  context "when young" do
    subject(:youngAppleTree) { AppleTree.new.age! }

    describe "#add_apples" do
      it { expect(youngAppleTree.add_apples).to eq(0) }
    end

    describe "#age!" do
      it "increments age" do
        priorAge = youngAppleTree.age
        youngAppleTree.age!
        expect(youngAppleTree.age).to eq(priorAge + 1)
      end
    end

    describe "#any_apples?" do
      it { expect(youngAppleTree.any_apples?).to be_falsey }
    end

    describe "#height" do
      it { expect(youngAppleTree.height).to be > 0 }
    end
  end

  context "when established" do
    subject(:establishedAppleTree) do
      tree = AppleTree.new
      4.times { tree.age! }
      tree
    end

    describe "#add_apples" do
      it { expect(establishedAppleTree.add_apples).to be > 0 }
    end

    describe "#dead?" do
      it { expect(establishedAppleTree.dead?).to be_falsey }
    end

    describe "#age!" do
      it "starts off year with some apples" do
        expect(establishedAppleTree.age!.any_apples?).to be_truthy
      end
    end
  end
  
  context "when tree has fruit" do
    subject(:treeWithFruit) do
      tree = AppleTree.new
      4.times { tree.age! }
      tree.add_apples
      tree
    end

    describe "#any_apples?" do
      it { expect(treeWithFruit.any_apples?).to be_truthy }
    end

    describe "#pick_an_apple!" do
      it "returns an Apple" do
        expect(treeWithFruit.pick_an_apple!).is_a? Apple
      end
    end

    describe "#pick_an_apple!" do
      it "decrements the count of apples" do
        priorCount = treeWithFruit.apples.count
        treeWithFruit.pick_an_apple!
        expect(treeWithFruit.apples.count).to eq(priorCount - 1)
      end
    end
  end

  context "when very old" do
    subject(:olderTree) do
      olderTree = AppleTree.new
      101.times { olderTree.age! }
      olderTree
    end

    describe "#height" do
      it { expect(olderTree.height).to be <= 60 }
    end

    describe "#dead?" do
      it { expect(olderTree.dead?).to be_truthy }
    end

    describe "#age!" do
      it "does not increment age" do
        priorAge = olderTree.age
        olderTree.age!
        expect(olderTree.age).to eq(priorAge)
      end
    end

    describe "#apples" do
      it { expect(olderTree.apples).to eq([]) }
    end

    describe "#add_apples" do
      it { expect(olderTree.add_apples).to eq(0) }
    end

    describe "#pick_an_apple!" do
      it { expect { olderTree.pick_an_apple! }.to raise_error NoApplesError }
    end
  end

end

describe 'Fruit' do
  it 'should be a Class' do
    expect(Fruit.is_a? Class).to be_truthy
  end
end

describe 'Apple' do
  it 'should be a Fruit' do
    expect(Apple.new(0,0).is_a? Fruit).to be_truthy
  end

  it 'saves initial color' do
    expect(Apple.new('red',0).color).to eq('red')
  end

  it 'saves initial diameter' do
    expect(Apple.new('red',10).diameter).to eq(10)
  end

end
