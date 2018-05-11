require 'rspec'
require_relative '../lib/tree'

describe Tree do
  let(:tree) { Tree.new }

  it 'is a brand new tree' do
    expect(tree.age).to eq 0
    expect(tree.height).to eq 0
    expect(tree.alive).to be_truthy
    expect(tree.apples).to be_empty
  end

  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  describe '#age!' do
    it 'increases the trees age' do
      expect { tree.age! }.to change { tree.age }.by 1
    end

    context 'when the tree is young' do
      before { tree.age = 5 }

      it 'increases the trees height' do
        expect { tree.age! }.to change { tree.height }.by 1
      end

      it 'adds apples to the tree' do
        expect { tree.age! }.to change { tree.apples.count }.by 5
      end
    end

    context 'when the tree is old' do
      before { tree.age = 55 }

      it 'does not increase the trees height' do
        expect { tree.age! }.to_not change { tree.height }
      end

      it 'adds apples to the tree' do
        expect { tree.age! }.to change { tree.apples.count }.by 5
      end
    end

    context 'when the tree is about to die' do
      before { tree.age = 99 }

      it 'does not increase the trees height' do
        expect { tree.age! }.to_not change { tree.height }
      end

      it 'does not add apples to the tree' do
        expect { tree.age! }.to_not change { tree.apples.count }
      end

      it 'kills the tree' do
        tree.age!
        expect(tree.alive).to be_falsey
      end
    end
  end

  describe '#add_apples' do
    it 'adds 5 apples to the tree' do
      expect { tree.add_apples }.to change { tree.apples.count }.by 5
    end
  end

  describe '#any_apples?' do
    context 'when the tree doesnt have apples' do
      before { tree.apples = [] }

      it 'returns false' do
        expect(tree.any_apples?).to be_falsey
      end
    end

    context 'when the tree does have apples' do
      before { tree.apples = [Apple.new('red', 2)]}

      it 'returns true' do
        expect(tree.any_apples?).to be_truthy
      end
    end
  end

  describe '#pick_an_apple!' do
    before { tree.add_apples }

    it 'returns an apple object' do
      expect(tree.pick_an_apple!).to be_instance_of Apple
    end

    it 'removes the apple from the tree' do
      expect { tree.pick_an_apple! }.to change { tree.apples.count } .by -1
    end
  end

  describe '#dead?' do
    context 'when the tree is alive' do
      before { tree.alive = true }

      it 'returns it is alive' do
        expect(tree.dead?).to be_falsey
      end
    end

    context 'when the tree is dead' do
      before { tree.alive = false }

      it 'returns it is dead' do
        expect(tree.dead?).to be_truthy
      end
    end
  end
end

describe Fruit do
end

describe Apple do
  let(:apple) { Apple.new('red', 3) }
  it 'is an instance of Fruit' do
    expect(apple).to be_a Fruit
  end

  it 'has a color and diameter' do
    expect(apple.color).to eq 'red'
    expect(apple.diameter).to eq 3
  end
end
