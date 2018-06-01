require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  describe '#age!' do
    subject { tree }

    context 'new tree' do
      let(:tree) { Tree.new }

      it 'should age 1 years' do
        tree.age!
        expect(tree.age).to eq 1
      end

      it 'should grow at least 2 feet a year' do
        tree.age!
        expect(tree.height).to be >= 2
      end
    end

    context 'a fruit bearing tree' do
      let(:tree) { Tree.new(0, Tree::FRUIT_AGE, [], true) }

      it 'should add apples every year' do
        tree.age!
        expect(tree.any_apples?).to eq true
      end
    end

    context 'almost dead tree' do
      let(:tree) { Tree.new(0, Tree::DEATH_AGE - 1, [], true) }

      it "should die when it when hits #{Tree::DEATH_AGE} years old" do
        tree.age!
        expect(tree.dead?).to eq true
      end
    end

    context 'a dead tree' do
      let(:tree) { Tree.new(0, Tree::DEATH_AGE, [], false) }

      it 'should throw an error if aged after tree is dead' do
        expect { tree.age! }.to raise_error DeadTreeError
      end
    end
  end

  describe '#pick_an_apple!' do
    subject { tree }

    context 'tree without apples' do
      let(:tree) { Tree.new }

      it 'should throw an error' do
        expect { tree.pick_an_apple! }.to raise_error NoApplesError
      end
    end

    context 'tree with one apple' do
      let(:tree) { Tree.new(0, Tree::FRUIT_AGE, [Apple.new('red', 2)], true) }

      it 'should return the last apple' do
        picked_apple = tree.pick_an_apple!
        expect(picked_apple.color).to eq 'red'
      end

      it 'should remove the apple from the tree' do
        tree.pick_an_apple!
        expect(tree.any_apples?).to eq false
      end
    end
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end
