require 'rspec'
require 'tree'

describe Tree do
  let(:tree_face) {Tree.new}

  it 'grows as it ages' do
    initial_height = tree_face.height
    tree_face.age!
    expect(tree_face.height).to be > initial_height
  end

  describe '#age!' do
    it 'increments the age of the Tree by 1' do
      tree_face.age!
      expect(tree_face.age).to eq(1)
    end
  end

  describe '#age!' do
    it 'increments the age of the Tree by 1' do
      tree_face.age!
      expect(tree_face.age).to eq(1)
    end
  end

  describe '#dead?' do
    context 'when tree age is under maximum age' do
      it 'returns false' do
        expect(tree_face.dead?).to be false
      end
    end

    context 'when tree age is over maximum age' do
      it 'returns true' do
        200.times {tree_face.age!}
        expect(tree_face.dead?).to be true
      end
    end
  end
end

describe AppleTree do
  let(:apple_face) {AppleTree.new}

  it 'is a Tree subclass' do
    expect(described_class.ancestors).to include Tree
  end

  describe '#add_apples?' do
    context 'when the tree is old enough to fruit' do
      it 'returns true' do
        5.times {apple_face.age!}
        expect(apple_face.add_apples?).to be true
      end
    end

    context 'when the tree is too young to fruit' do
      it 'returns false' do
        expect(apple_face.add_apples?).to be false
      end
    end
  end

  describe '#add_apples' do
    it 'adds apples when called' do
      initial_apples = apple_face.apples
      apple_face.add_apples
      expect(apple_face.apples).not_to be_empty
    end
  end

  describe '#any_apples?' do
    it 'returns false if there are no apples' do
      expect(apple_face.any_apples?).to be false
    end

    it 'returns true if there are apples' do
      apple_face.add_apples
      expect(apple_face.any_apples?).to be true
    end
  end

  describe '#pick_an_apple!' do
    context 'when there are apples' do
      before {apple_face.add_apples}

      it 'removes 1 apple from the tree' do
        initial_apples = apple_face.apples.size
        apple_face.pick_an_apple!
        expect(apple_face.apples.size).to eq(initial_apples - 1)
      end

      it 'returns an Apple object' do
        expect(apple_face.pick_an_apple!).to be_instance_of Apple
      end
    end

    context 'when there are no apples' do
      it 'raises a NoApplesError' do
        expect {apple_face.pick_an_apple!}.to raise_error NoApplesError
      end
    end
  end
end

describe 'Fruit' do
end

describe Apple do
  let(:test_apple) {Apple.new('')}

  it 'is a Fruit subclass' do
    expect(described_class.ancestors).to include Fruit
  end
end

