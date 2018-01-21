require 'rspec'
require 'tree'

describe AppleTree do
  let(:tree) { AppleTree.new }

  it { expect(tree.class).to be AppleTree  }

  it 'will age' do
  	tree.age = rand(1..10)
  	previous_tree_age = tree.age
  	tree.age!
    expect(tree.age).to eq (previous_tree_age + 1)
  end

  it 'can add apples' do
  	tree.age = 4
    tree.add_apples
    expect(tree.any_apples?).to be true
  end

  context 'when picking apples' do

  	it 'raises an error for no apples' do
  	  expect { tree.pick_an_apple! }.to raise_error(NoApplesError, "This tree has no apples")
  	end

  	it 'removes an apple when present' do
  	  tree.age!
  	  remaining_apples = tree.apples.length - 1
  	  tree.pick_an_apple!
  	  expect(tree.apples.length).to eq remaining_apples
  	end

  end
end

describe Fruit do
  let(:fruit) { Fruit.new }

  it { expect(fruit.class).to be Fruit }

  it { expect(fruit.has_seeds).to be true }
end

describe Apple do
  let(:apple) { Apple.new }

  it "should have a color" do
  	colors = ['red', 'green', 'yellow']
  	expect(colors).to include apple.color
  end

  it 'should have a diameter' do
  	expect(apple.diameter).to be_between(1,5).inclusive
  end
end
