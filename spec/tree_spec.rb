require 'rspec'
require_relative '../lib/tree'

describe Tree do

  let(:tree) {Tree.new}

  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq true
  end


  it 'should start with nothing' do
    expect(tree.age).to eq 0
    expect(tree.height).to eq 0
    expect(tree.apples.size).to eq 0
    expect(tree.alive).to eq true
  end

  it "should be growing" do
    tree.age!
    expect(tree.age! > 0).to eq true
  end

  it 'should grow apples' do
    6.times {tree.age!}
    expect(tree.any_apples?).to eq true
  end

  it "should drop apples" do
    6.times {tree.age!}
    expect(tree.pick_an_apple!).to be_a Apple
  end

  it "should die" do
    16.times {tree.age!}
    expect(tree.alive).to eq false
  end

end

describe Fruit do

let(:fruit) {Fruit.new}

  it 'should be a Class' do
    expect(Fruit.is_a? Class).to eq true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end

end

describe Apple do

let(:apple) {Apple.new('Green', 2)}

  it 'should be a Class' do
    expect(Apple.is_a? Class).to eq true
  end

  it 'should have seeds' do
    expect(apple.has_seeds).to eq true
  end

  it 'should have color' do
    expect(apple.color).to eq 'Green'
  end

  it 'should have a diameter' do
    expect(apple.diameter).to eq 2
  end

end
