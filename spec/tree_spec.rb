require 'rspec'
require 'tree'

testTree = Tree.new

describe 'Tree' do
  it 'is a Class' do
    expect(Tree.is_a? Class).to be true
  end

  it 'grows one foot' do
  	testTree.age!
  	expect(testTree.height).to eq(1)
  end

  it 'ages one year' do
  	expect(testTree.age).to eq(1)
  end

  it 'has no fruit' do
  	expect(testTree.any_apples?).to be false
  end


  it 'has apples after 3 years' do
  	testTree.age!
  	testTree.age!
  	expect(testTree.any_apples?).to be true
  end

  it 'dies after 16 years' do
  	(1..13).each{ |idx| testTree.age!}
  	expect(testTree.dead?).to be true
  end
end

describe 'Fruit' do
	it 'is a Class' do
		expect(Fruit.is_a? Class).to be true
	end
end

testApple = Apple.new("Red", 30)

describe 'Apple' do
	it 'is a Class' do
		expect(Apple.is_a? Class).to be true
	end

	it 'is a Fruit' do
		expect(Apple < Fruit).to be true
	end


	it 'sets a color' do
		expect(testApple.color).to eq("Red")
	end

	it 'sets a diameter' do
		expect(testApple.diameter).to eq(30)
	end

	it 'calls super()' do
		expect(testApple.has_seeds).to be true
	end
end
