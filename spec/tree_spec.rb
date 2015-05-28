require 'rspec'
require 'tree'

describe 'Tree' do
  let(:tree) { AppleTree.new }

  it 'should age' do
    before_age = tree.age
    tree.age!
    expect(tree.age).to eq(before_age + 1)
  end

  it 'should add apples' do
    before_count = tree.apples.count
    tree.add_apples
    expect(tree.apples.count).to be > before_count
  end

  it 'should originally have no apples' do
    expect(tree.any_apples?).to eq(false)
  end

  it 'should be able to have apples' do
    tree.apples << Apple.new('red', 5)
    expect(tree.any_apples?).to be true
  end

  it 'should not let you pick no apples' do
    expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
  end

  it 'should let you to pick an apple' do
    tree.add_apples
    apple = tree.pick_an_apple!

    expect(apple.is_a? Apple).to be true
  end

  it 'should originally be alive' do
    expect(tree.dead?).to eq(false)
  end

  it 'should die' do
    tree.alive = false
    expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
  before(:each) do
    @fruit = Fruit.new
  end

  it 'should have seeds' do
    expect(@fruit.has_seeds).to be true
  end
end

describe 'Apple' do
  before(:each) do
    @apple = Apple.new('green', 5.3)
  end

  it 'should have seeds' do
    expect(@apple.has_seeds).to be true
  end

  it 'should have a color' do
    expect(@apple.color).not_to be_nil
  end

  it 'should have a diameter' do
    expect(@apple.diameter).not_to be_nil
  end
end
