require 'rspec'
require_relative '../lib/tree'

describe Tree do
  let(:treeOne) {described_class.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  context 'when tree is Alive' do
  	it 'Should be alive with age =1, height = 1' do
		expect(treeOne.age).to eq 1
		expect(treeOne.height).to eq 1
		expect(treeOne.dead?).to be false
	end	

	it 'Should Increment the age and height as aging' do
		treeOne.age!
		expect(treeOne.age).to eq 2
		expect(treeOne.height).to eq 2
		expect(treeOne.dead?).to be false
	end

	context 'when no apples' do
		it 'Should have no apples unless added' do
			expect(treeOne.any_apples?).to be false
		end

		it 'Should raise exception to pick an apple' do ##When expecting an error/exception pass it as a block of code
			expect {
				treeOne.pick_an_apple!
			}.to raise_exception(NoApplesError)
		end
	end

	context 'when apples added' do 
		it 'Should add apples when add_apples is called' do
			treeOne.add_apples
			expect(treeOne.any_apples?).to be true
		end

		it 'Should decrement apples when picked' do
			treeOne.add_apples
			total_apples = treeOne.apples.length
			treeOne.pick_an_apple!
			expect(treeOne.apples.length).to eq (total_apples - 1)
		end
	end
  end

  context 'when tree is Dead' do
  	it 'Should return true when the tree is dead and the dead method is called' do
  		while treeOne.alive
  			treeOne.age!
  		end
  		expect(treeOne.dead?).to be true
	end  	

	it 'Should have a possitive value for age and heigt' do
		expect(treeOne.age).to be > 0
		expect(treeOne.height).to be > 0
  	end

  end
end

describe Fruit do
	let(:fruit) {described_class.new}

	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end

	it 'should have seeds' do
		expect(fruit.has_seeds).to be true
	end
end

describe Apple do
	let(:apple) {described_class.new("red",4)}

	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end

	it 'should be red in color' do
		expect(apple.color).to eq "red"
	end

	it 'should be 4 in diameter' do
		expect(apple.diameter).to eq 4
	end

end
