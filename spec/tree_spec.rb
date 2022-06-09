require 'rspec'
require_relative '../lib/tree'

describe Tree do
  let (:tree) {Tree.new}

  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq true
  end

  it 'should initalize empty' do
    expect(tree.apples).to eq []
    expect(tree.alive).to eq true
    expect(tree.height).to eq 0
    expect(tree.age).to eq 0
  end

  it 'should grow when it ages' do 
    tree.age!
    expect(tree.height > 0).to eq true
    expect(tree.age).to eq 1
  end

  it 'should gorw apples' do
    7.times {tree.age!}
    expect(tree.any_apples?).to eq true
  end

  it 'should be able to pick an apple' do 
    7.times {tree.age!}
    expect(tree.pick_an_apple!).to be_a Apple
  end

  it 'should die of old age' do
    12.times {tree.age!}
    expect(tree.alive).to eq false
  end
end

describe 'Fruit' do
  let(:fruit) {Fruit.new}

  
  it 'should be a Class' do
    expect(Fruit.is_a? Class).to eq true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end
end

describe 'Apple' do
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
