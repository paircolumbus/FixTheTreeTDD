require 'rspec'
require 'tree'

describe AppleTree do
  def age_a_tree(tree, years)
    years.times { tree.age! }
    tree
  end

  let(:tree) { described_class.new }

  it 'should be a Class' do
    expect(described_class).to be_a Class
  end

  describe "instances" do
    it "can be instantiated" do
      expect(tree).to be_a described_class
    end

    it "should increase in age by 1 when aged" do
      expect{ tree.age! }.to change{tree.age}.by(1)
    end

    context "that are new" do
      it "should have an age of zero" do
        expect(tree.age).to be 0
      end

      it "should have a height of zero" do
        expect(tree.height).to be 0
      end

      it "should have no apples" do
        expect(tree.apples).to be_empty
      end

    end

    context "under 5 years old" do
      it 'should not grow apples' do
        expect(age_a_tree(tree, 4).any_apples?).to eq false
      end

      it 'should throw an error when trying to pick an apple' do
        expect{ tree.pick_an_apple! }.to raise_error(NoApplesError)
      end
    end

    context "5 years and older" do
      let(:fruiting_tree) { age_a_tree described_class.new, 5 }

      it 'should have apples' do
        expect(age_a_tree(tree, 5).any_apples?).to eq true
      end

      it 'should return an apple when picking an apple' do
        expect(fruiting_tree.pick_an_apple!).to be_an Apple
      end

      it 'should have fewer apples when they are picked' do
        expect{ fruiting_tree.pick_an_apple! }.to change{fruiting_tree.apples.count}.by(-1)
      end
    end

    context "that are nearing death" do
      let(:old_tree) { age_a_tree described_class.new, 50 }

      it "should die when they are over 50 years" do
        expect{ old_tree.age! }.to change{ old_tree.dead? }.from(false).to(true)
      end

      it "should not grow apples when they die" do
        expect{ old_tree.age! }.to change{ old_tree.apples.count }.to(0)
      end
    end

    context "that are dead" do
    let(:dead_tree) { age_a_tree described_class.new, 51 }



      it "should not age" do
        expect{ dead_tree.age! }.to_not change{ dead_tree.age }
      end

      it "should not get taller" do
        expect{ dead_tree.age! }.to_not change{ dead_tree.height }
      end

      it "should not grow apples" do
        expect{ dead_tree.age! }.to_not change{ dead_tree.apples }
      end
    end
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class).to be_a Class
  end

  it "should have seeds" do
    expect(described_class.new.has_seeds).to eq true
  end
end

describe Apple do
  let(:an_apple) { described_class.new }

  it 'should be a Fruit' do
    expect(an_apple).to be_a Fruit
  end

  it 'should have a color' do
    expect(an_apple).to respond_to(:color)
  end

  it 'should have a diameter' do
    expect(an_apple).to respond_to(:diameter)
  end
end
