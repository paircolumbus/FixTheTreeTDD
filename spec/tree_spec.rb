require 'rspec'
require 'tree'

describe 'Tree' do

  let(:tree) {$tree = Tree.new}

  it 'should be a Class' do
    expect(Tree.new.is_a? Tree).to be(true)
  end

  it '.initialize' do
  	expect(tree.height == 0).to be true
  	expect(tree.age == 0).to be true
  	expect(tree.apples == 0).to be true
  	expect(tree.alive).to be true
  end
  	
  # as the tree ages, more apples grow.
  # 2^age apples should be on the tree after it ages
  it '.age!' do
  	expect(tree.age == 0).to be true
  	3.times { tree.age! }
  	expect(tree.age == 3).to be true
  	expect(tree.apples == 8).to be true
  	expect(tree.height == 3).to be true
  end

  it '.add_apples' do
  	expect(tree.apples == 0).to be true
  	3.times { tree.age! }
  	expect(tree.apples == 8).to be true
  end

  it '.any_apples?' do
  	expect( tree.any_apples? ).to be false
  	tree.age!
  	expect( tree.any_apples? ).to be true
  	2.times { tree.pick_an_apple! }
  	expect( tree.any_apples? ).to be false
  end

  it '.pick_an_apple!' do
    expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
  	tree.age!
  	tree.pick_an_apple!
  	expect(tree.apples == 1).to be true
  end

  it '.dead?' do
  	expect(tree.dead?).to be false
  	4.times { tree.age! }
  	expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
	it '.has_seeds' do
		fruit = Fruit.new
		expect(fruit.has_seeds).to be true
	end

end

describe 'Apple' do
	it '.initialize' do
		apple = Apple.new "red", 3
		expect( apple.has_seeds).to be true
		expect( apple.color == "red" ).to be true
		expect( apple.diameter == 3).to be true
	end
end
