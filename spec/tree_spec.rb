require 'rspec'
require 'tree'

describe Tree do
  let(:tree) { Tree.new }

  it 'should be an AppleTree' do
    expect(tree.is_a? Tree).to be true
  end

  it 'should have a height of 0' do
    expect(tree.height).to be 0  
  end

  it 'should have an age of 0' do
    expect(tree.age).to be 0
  end

  it 'should have an empty set of apples' do
    expect(tree.apples).to eq []
  end

  describe '#age!' do
    
    context 'after aging once' do
      before(:each) { tree.age! }

      it 'age is 1' do
        expect(tree.age).to be 1
      end

      it 'height is 1' do
        expect(tree.height).to be 1
      end

      it 'has 5 apples' do
        expect(tree.apples.length).to be 5     
      end

    end
    
    context 'after aging twice' do
      before(:each) { tree.age!; tree.age! }

      it 'age is 2' do
        expect(tree.age).to be 2
      end
      
      it 'height is 2' do
        expect(tree.height).to be 2
      end

      it 'has 15 apples' do
        expect(tree.apples.length).to eq 15
      end

    end 

    context 'after aging to 100' do
      before(:each) do
        tree.age = 99
        tree.height = 99
        tree.age!
      end

      it 'age is 100' do
        expect(tree.age).to eq 100
      end

      it 'height is 100' do
        expect(tree.age).to eq 100
      end

      it 'is dead' do
        expect(tree.dead?).to be true
      end

      it 'has 500 apples' do
        expect(tree.apples.length).to eq 500
      end

    end

  end

  describe '#add_apples' do
    
    context 'when tree is 1 year old' do
      before(:each) do
        tree.age = 1
        tree.add_apples
      end      
      
      it 'should add 5 apples' do
        expect(tree.apples.length).to eq 5
      end

      it 'apples should contain apple objects' do
        expect(tree.apples[0].is_a? Apple).to be true
      end

    end

    context 'when tree is 10 years old' do
      before :each do
        tree.age = 10
        tree.add_apples
      end

      it 'should add 50 apples' do
        expect(tree.apples.length).to eq 50
      end
    end

  end

  describe '#grown_apple' do
    
    it 'should be red' do
      expect(tree.grown_apple.color).to eq "red"
    end

    it 'should be atleast 5 in diameter' do
      expect(tree.grown_apple.diameter).to be >= 5
    end

    it 'should be at most 15 in diameter' do
      expect(tree.grown_apple.diameter).to be <= 15
    end

  end

  describe '#any_apples?' do

    it 'should be false any apples when applies is empty' do
      tree.apples = []
      expect(tree.any_apples?).to be false
    end
    
    it 'should be true when apples is not empty' do
      tree.apples = [ Apple.new("", 1) ]
      expect(tree.any_apples?).to be true
    end

  end

  describe '#pick_an_apple!' do
    
    context 'no apples on tree' do
      before(:each) { tree.apples = [] }

      it 'should raise a NoApplesError when there are no apples' do
        expect {tree.pick_an_apple!}.
          to raise_error(NoApplesError, "This tree has no apples")
      end

    end

    context 'one apple on the tree' do
      before(:each) { tree.apples = [ Apple.new("red", 1) ] }

      it 'should return an apple' do
        expect(tree.pick_an_apple!.is_a? Apple).to be true
      end

      it 'should remove the apple from the tree' do
        tree.pick_an_apple!
        expect(tree.any_apples?).to be false
      end
    
    end

    context 'two apples on the tree' do
      before(:each) { tree.apples = [ Apple.new("red", 1), Apple.new("green", 2) ] }

      it 'should still have an apple after picking one' do
        tree.pick_an_apple!
        expect(tree.any_apples?).to be true
      end 

    end

  end
  
  describe 'alive and dead' do

    it 'should be alive' do
      expect(tree.alive).to be true
    end

    it 'should not be dead' do
      expect(tree.dead?).to be false
    end

  end
 

end

describe Fruit do
  let(:fruit) { Fruit.new }

  it 'should have seeds' do
    expect(fruit.has_seeds).to be true
  end

end

describe Apple do
  
  context 'Red 10 Diameter Apple' do
    let(:apple) { Apple.new("red", 10) }
    
    it 'should be red' do
      expect(apple.color).to eq "red"
    end

    it 'should have a diameter of 10' do
      expect(apple.diameter).to eq 10
    end
    
    it 'should have seeds' do
      expect(apple.has_seeds).to be true
    end

  end
  
  context 'Green 15 Diameter Apple' do
    let(:apple) { Apple.new("green", 15) }
  
    it 'should be green' do
      expect(apple.color).to eq "green"
    end

    it 'should have a diameter of 15' do
      expect(apple.diameter).to eq 15
    end    

  end
end
