require 'rspec'
require 'tree'

describe 'Tree' do
	let(:tree) { Tree.new }
  it 'is an AppleTree' do
    expect(tree.is_a? AppleTree).to be true
  end

  it 'is alive' do
  	expect(tree.dead?).to be false
  end

  it 'ages' do
  	tree.age!
  	expect(tree.age).to eq 1
  end

  it 'grows' do
  	height = tree.height
  	tree.age!
  	expect(tree.height).to be > height
  end

  it 'does not grow some apples' do
  	expect(tree.any_apples?).to be false
  end

  it 'grows some apples' do
  	6.times{tree.age!}
  	expect(tree.any_apples?).to be true
  end
  it 'grows some real apples' do
  	tree.apples.each{|apple|
  		expect(apple.is_a? Apple).to be true
  	}
  end

  it 'drops apples when picked' do
  	6.times{tree.age!}
  	count = tree.apples.size
  	tree.pick_an_apple!
  	expect(tree.apples.size).to eq count - 1
  end

  it 'gives an apple when picked' do
  	6.times{tree.age!}
  	apple = tree.pick_an_apple!
  	expect(apple.is_a? Apple).to be true
  end

  it 'dies when its old' do
  	80.times{tree.age!}
  	expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
	let(:fruit) { Fruit.new }
	it 'has some seeds' do
		expect(fruit.has_seeds).to be true
	end
end

describe 'Apple' do
	let(:apple) {Apple.new "red",4}
	it 'has a color' do
		expect(apple.color).to eq "red"
	end

	it 'has a diameter' do
		expect(apple.diameter).to eq 4
	end
end