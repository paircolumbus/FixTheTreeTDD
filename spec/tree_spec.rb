require 'rspec'
require 'tree'

describe 'Tree' do
  it 'should be a Class' do
    expect(Tree.new.is_a? Tree).to be(true)
  end

  it '.initialize' do
  	tree = Tree.new
	expect(tree.height == 0).to be true
	expect(tree.age == 0).to be true
	expect(tree.apples == 0).to be true
	expect(tree.alive).to be true
  end
  	
  # as the tree ages, more apples grow.
  # 2^age apples should be on the tree after it ages
  it '.age!' do
  	tree = Tree.new
	expect(tree.age == 0).to be true
	3.times { tree.age! }
	expect(tree.age == 3).to be true
	expect(tree.apples == 8).to be true
  end

  it '.add_apples' do
  	tree = Tree.new
	expect(tree.apples == 0).to be true
	3.times { tree.age! }
	expect(tree.apples == 8).to be true
  end

  it '.any_apples?' do
    tree = Tree.new
	expect( tree.any_apples? ).to be false
	tree.age!
	expect( tree.any_apples? ).to be true
	2.times { tree.pick_an_apple! }
	expect( tree.any_apples? ).to be false
  end

  it '.pick_an_apple!' do
  	tree = Tree.new
	expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
	tree.age!
	tree.pick_an_apple!
	expect(tree.apples == 1).to be true
  end

  it '.dead?' do
	tree = Tree.new
	expect(tree.dead?).to be false
	42.times { tree.age! }
	expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
