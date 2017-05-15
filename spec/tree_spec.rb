require 'rspec'
require 'tree'

describe 'Tree' do
  it 'should be a Class' do
    expect(AppleTree.is_a? Class).to be true
  end

	it 'should initially have an age of 0' do
		expect(AppleTree.new.age).to be 0
	end

	it 'should increase its age by one each year' do
		tree = AppleTree.new
		tree.age!
		expect(tree.age).to be 1
	end

	it 'should not produce any apples before year 5' do
		tree = AppleTree.new
		year = 0
		loop do 
			tree.age!
			year += 1
			
			break if year >= 4
		end
		expect(tree.apples).to be 0	
	end				

	it 'should produce some apples after year 5' do
		tree = AppleTree.new
		tree.age = 5
		tree.age!
		expect(tree.apples).to be > 0
	end

	it 'should die after 25 years' do
		tree = AppleTree.new
		tree.age = 24
		tree.age!
		expect(tree.dead?).to be true
	end

end

describe 'Fruit' do
	it 'should have seeds' do
		expect(Fruit.new.has_seeds).to be true
	end
end

describe 'Apple' do
	it 'should also have seeds since it inherits from Fruit' do
		expect(Apple.new("Red", rand + 2).has_seeds).to be true
	end
end
