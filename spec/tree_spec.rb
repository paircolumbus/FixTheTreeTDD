require 'rspec'
require 'tree'

describe 'Tree' do

  let(:tree) {$tree = Tree.new}

  it 'should be a Class' do
    expect(Tree.new.is_a? Tree).to be(true)
  end

  it '.initialize' do
    expect(tree.height).to eq 0
    expect(tree.age).to eq 0
    expect(tree.apples.length).to eq 0
  	expect(tree.alive).to be true
  end

  # as the tree ages, more apples grow.
  # 2^age apples should be on the tree after it ages
  it '.age!' do
    expect(tree.age).to eq 0
  	3.times { tree.age! }
    expect(tree.age).to eq 3
    expect(tree.apples.length).to eq 6
    expect(tree.height).to eq 3
  end

  it '.add_apples' do
    expect(tree.apples.length).to eq 0
  	3.times { tree.age! }
    expect(tree.apples.length).to eq 6
  end

  it '.any_apples?' do
  	expect( tree.any_apples? ).to be false
  	2.times { tree.age! }
  	expect( tree.any_apples? ).to be true
  	3.times { tree.pick_an_apple! }
  	expect( tree.any_apples? ).to be false
  end

  it '.pick_an_apple!' do
    expect{tree.pick_an_apple!}.to raise_error(NoApplesError)
  	tree.age!
  	apple = tree.pick_an_apple!
    expect(apple.color).to eq "red"
    expect(apple.diameter).to be_within(4).of(4)
    expect(tree.apples.length).to eq 0
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
