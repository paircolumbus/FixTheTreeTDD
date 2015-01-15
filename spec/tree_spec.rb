require 'rspec'
require 'tree'

describe "Tree" do
  before :each do
    @tree = Tree.new
  end

  it 'should be a Class' do
    expect(Tree.is_a? Class).to be_truthy
  end

  describe '#new' do
    it 'should be alive but not grown' do
      expect(@tree.age).to be 0
      expect(@tree.height).to be 0
      expect(@tree.apples).to be 0
      expect(@tree.alive).to be true
    end
  end

  describe '#age!' do
    it 'should age every year until death' do
      last_age = @tree.age
      while @tree.alive
        @tree.age!
        expect(@tree.age).to be last_age + 1
        last_age = @tree.age
      end
    end

    it 'should not age after death' do
      @tree.age! while @tree.alive
      death_age = @tree.age
      @tree.age!
      expect(@tree.age).to be death_age
    end

    it 'should get taller every year until it dies' do
      while @tree.alive
        last_height = @tree.height
        @tree.age!
        expect(@tree.height).to be > last_height
      end
    end

    it 'should not get taller after death' do
      @tree.age! while @tree.alive
      death_height = @tree.height
      @tree.age!
      expect(@tree.height).to be death_height
    end

    it 'should live until at least 5 years old' do
      5.times { @tree.age! }
      expect(@tree.alive).to be true
    end

    it 'should die before it is 10' do
      10.times { @tree.age! }
      expect(@tree.alive).to be false
    end

    it 'should not grow apples before age 4' do
      4.times do
        expect(@tree.apples).to be 0
        @tree.age!
      end
    end

    it 'should grow apples each year from 4 to death' do
      last_count = @tree.apples
      4.times { @tree.age! }
      while @tree.alive
        expect(@tree.apples).to be > last_count
        last_count = @tree.apples
        @tree.age!
      end
    end

    it 'should not grow apples after death' do
      @tree.age! while @tree.alive
      last_count = @tree.apples
      @tree.age!
      expect(@tree.apples).to be last_count
    end
  end

  describe '#add_apples' do
    it 'should add apples when called' do
      last_count = @tree.apples
      @tree.add_apples
      expect(@tree.apples).to be > last_count
    end
  end

  describe '#any_apples?' do
    it 'should return false if there are no apples' do
      expect(@tree.any_apples?).to be false
    end

    it 'should return true if there are apples' do
      @tree.add_apples
      expect(@tree.any_apples?).to be true
    end
  end

  describe '#any_apple?' do
    it 'should match the output of #any_apple' do
      expect(@tree.any_apple?).to be @tree.any_apples?
      @tree.age!
      expect(@tree.any_apple?).to be @tree.any_apples?
    end
  end

  describe '#pick_an_apple' do
    it 'should raise NoApplesError if there are no apples to be picked' do
      expect{@tree.pick_an_apple!}.to raise_error NoApplesError
    end

    it 'should return an apple if there are apples to be picked' do
      @tree.age! until @tree.any_apples?
      expect(@tree.pick_an_apple!).to be_an Apple
    end

    it 'should decrement the available apple count' do
      @tree.age! until @tree.any_apples?
      last_count = @tree.apples
      @tree.pick_an_apple!
      expect(@tree.apples).to be last_count - 1
    end
  end

  describe '#dead?' do
    it 'should return false if alive' do
      expect(@tree.dead?).to be false
    end

    it 'should return true if not alive' do
      @tree.age! while @tree.alive
      expect(@tree.dead?).to be true
    end
  end
end

describe 'Apple' do
  before :each do
    @apple = Apple.new
  end

  it 'should be a Class' do
    expect(Apple.is_a? Class).to be_truthy
  end

  describe '#new' do
    it 'should have a color' do
      expect(@apple.color).to be_a String
    end

    it 'should have a diameter' do
      expect(@apple.diameter).to be_a Float
    end
  end
end
