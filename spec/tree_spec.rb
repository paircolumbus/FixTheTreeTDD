
require 'spec_helper' 

describe Tree do
  let(:tree){ Tree.new }
  let(:apple){ Apple.new "green", 5}

  class Tree
  	attr_accessor :age, :apples, :prng
  end

  class Fruit
  	attr_accessor :has_seeds
  end

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

  it 'should grow 2.2 meters every year' do
  	tree.age!
  	expect(tree.height.round(2)).to be 22.00
  	tree.age!
  	expect(tree.height.round(2)).to be 48.40
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

  it 'should grow 2 apples after one year' do
  	tree.prng = Random.new(1423)
  	tree.age!
  	expect(tree.apples.length).to be 2
  end

  it "should never have more than 10 apples" do
  	7.times{ tree.age! }
  	expect(tree.apples.length).to be <= 10
  end

  it 'should contain apples after 2 years' do
  	tree.prng = Random.new(1423)
  	2.times{tree.age!}
  	expect(tree.any_apples?).to be true
  end

  it 'should not contain apples after 4 years' do 
  	tree.prng = Random.new(1423)
  	4.times{tree.age!}
  	expect(tree.any_apples?).to be false
  end

  it 'should return an apple when it is picked and apples are on the tree' do
  	tree.apples.push (apple)
  	expect(tree.pick_an_apple!).to be_an(Apple)
  end

  it 'should raise an exception when there are no apples on the tree and an attempt is made to pick one' do
  	expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
  end

  it "should report dead when it's not alive" do
  	expect(tree.dead?).to_not be tree.alive
  end

  it "should report not dead when instantiated" do
  	expect(tree.dead?).to be false
  end

  it "should be dead when it ages to 61 years old" do
    tree.age = 60
    tree.age!
  	expect(tree.dead?).to be true
  end

end

describe 'Fruit' do
	let(:fruit){ Fruit.new }

	it 'should have seeds' do
		expect(fruit.has_seeds).to be true
	end
end

describe 'Apple' do
	let(:apple){ Apple.new "green", 5 }

	it 'should have the correct values after initialization' do
		expect(apple.color).to eq("green")
		expect(apple.diameter).to eq(5)
	end

	it 'should have seeds' do
		expect(apple.has_seeds).to be true
	end
end
