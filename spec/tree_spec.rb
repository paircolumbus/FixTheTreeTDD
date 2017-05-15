require 'rspec'
require 'tree'

#run with rspec spec/tree_spec
shared_examples "class_check" do |tree_class|
  it 'is a class' do
    expect(tree_class.is_a? Class).to be true
  end
end

describe Tree do
  before(:each) do
    @tree=Tree.new
  end

  include_examples "class_check", described_class

  it 'should be alive when born' do
    expect(@tree.dead?).to be false
  end

  it 'should have no apples at the start' do
    expect(@tree.any_apples?).to be false
  end

  it 'should have no height when born' do
    expect(@tree.height==0)
  end

  it 'should raise an error when popping no apples' do
    expect(@tree.any_apples?).to be false
    expect{@tree.pick_an_apple!}.to raise_error NoApplesError
  end

  it 'should increase apples as it ages' do
    apple_count_before = @tree.apples.count
    @tree.age!
    apple_count_after = @tree.apples.count
    expect(apple_count_before<apple_count_after)
  end

  it 'should grow in height as it ages' do
    height_before = @tree.height
    @tree.age!
    height_after = @tree.height
    expect(height_before < height_after)
  end

  it 'should die after five year of age' do
    7.times {@tree.age!}
    expect(@tree.dead?).to be true
  end

  it 'should have no apples after five years of age' do
    7.times{@tree.age!}
    expect(@tree.any_apples?).to be false
  end

  it 'should have the same height as before it dies' do
    7.times{@tree.age!}
    before_height=@tree.height
    @tree.age!
    after_height=@tree.height
    expect(before_height==after_height)
  end

end

describe Fruit do
  include_examples "class_check", described_class
end

describe Apple do
  before(:each) do
    @apple = Apple.new("red",2)
  end

  include_examples "class_check", described_class

  it 'should be an inheriting class' do
    expect(described_class < Fruit). to be true
  end

  it 'should be red' do
    expect(@apple.has_seeds).to be true
  end
  it 'should have diameter 2' do
    expect(@apple.diameter==2)
  end
  it 'should be red' do
    expect(@apple.color=="red")
  end

end
