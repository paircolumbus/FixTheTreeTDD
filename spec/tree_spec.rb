require 'rspec'
require 'tree'

describe Tree do
  let(:tree){ Tree.new 10,1,[],true }
  let(:apple){ Apple.new "green", 5}

  it 'is available as a described_class' do
    expect(described_class).to eq(Tree)
  end

  it 'should have the correct values after initialization' do
  	# tree.initialize(10,1,0,true)
  	expect(tree.height).to be 10
  	expect(tree.age).to be 1
  	expect(tree.apples.length).to be 0
  end

  it 'should age one year when age is called' do
  	# tree.initialize(10,1,0,true)
  	tree.age!
  	expect(tree.age).to be 2
  end

  it 'should call "add_apples" when it ages' do
  	# tree.initialize(10,1,0,true)
  	expect(tree).to receive(:add_apples).with(no_args)
  	tree.age!
  end

  it 'should add a number of apples between 0 and 10 every year' do
  	# tree.initialize(10,1,0,true)
  	tree.age!
  	expect(tree.apples.length).to be_between(0, 10)
  end

  it 'should have no apples before it ages' do
  	expect(tree.any_apples?).to be false
  end

# to-do
  it 'should grow x apples after one year' do

  end
# to-do
  it 'should contain apples after x year/s' do

  end

  it 'should return an apple when it is picked and apples are on the tree' do
  	tree.apples.push(apple)
  	picked_apple = tree.pick_an_apple!
  	expect(tree.pick_an_apple!).to be(Apple)
  end

  it 'should raise an exception when there are no apples on the tree and an attempt is made to pick one' do
  	expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
  end

  it "should report dead when it's not alive" do

  end

  it "should report not dead when instantiated" do

end

describe 'Fruit' do
end

describe 'Apple' do
end
