require 'rspec'
require 'tree'

describe AppleTree do

  before :all do
	 @appleTree = AppleTree.new
  end

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have an empty apple array' do
    expect(@appleTree.apples).to be_empty
  end

  it 'should age 1 year on #age!' do
    @appleTree.age!
    expect(@appleTree.age).to eq(1)
  end

  it 'should have apples after aging' do
    expect(@appleTree.apples).not_to be_empty
  end

  it 'should subtract 1 apple when #pick_an_apple! is called' do
    applesBeforePicking = @appleTree.apples.size
    @appleTree.pick_an_apple!
    expect(@appleTree.apples.size).to eq(applesBeforePicking - 1)
  end
  	
end

describe Fruit do
  it 'should be a Class' do
	 expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  before :all do
	 @apple = Apple.new('red', 3)
  end

  it 'should be a Class' do
	 expect(described_class.is_a? Class).to be true
  end

  it 'should have seeds' do
	 expect(@apple.has_seeds).to be true
  end
end
