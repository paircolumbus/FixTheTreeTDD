require 'rspec'
require 'tree'

describe Tree do
  let(:apple_face) {Tree.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should grow as it ages' do
    initial_height = apple_face.height
    apple_face.age!
    expect(apple_face.height).to be > initial_height
  end

  describe '#age!' do
    it 'should increment the age of the Tree by 1' do
      apple_face.age!
      expect(apple_face.age).to eq(1)
    end
  end
  
  describe '#add_apples?' do
    context 'when the tree is old enough to fruit' do
      it 'should return true' do
        5.times {apple_face.age!}
        expect(apple_face.add_apples?).to be true
      end
    end

    context 'when the tree is too young to fruit' do
      it 'should return false' do
        expect(apple_face.add_apples?).to be false
      end
    end
  end

  describe '#add_apples' do
    it 'should add apples when called' do
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
      it 'removes 1 apple from the tree' do
        apple_face.add_apples
        initial_apples = apple_face.apples.size
        apple_face.pick_an_apple!
        expect(apple_face.apples.size).to eq(initial_apples - 1)
      end

      it 'returns an Apple object' do
        apple_face.add_apples
        expect(apple_face.pick_an_apple!).to be_instance_of(Apple)
      end
    end

    context 'when there are no apples' do
      it 'raises a NoApplesError' do
        expect {apple_face.pick_an_apple!}.to raise_error(NoApplesError)
      end
    end
  end

  describe '#dead?' do
    context 'when tree age is under maximum age' do
      it 'should return false' do
        expect(apple_face.dead?).to be false
      end
    end
    
    context 'when tree age is over maximum age' do
      it 'should return true' do
        200.times {apple_face.age!}
        expect(apple_face.dead?).to be true
      end
    end
  end

end

describe 'Fruit' do
end

describe Apple do
  let(:test_apple) {Apple.new('')}

  it 'should be a subclass of Fruit' do
    expect(described_class.ancestors).to include Fruit
  end
end

