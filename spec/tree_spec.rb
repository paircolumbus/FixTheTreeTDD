require 'rspec'
require 'tree'

describe 'Tree' do
  let(:tree) { Tree.new }

  it 'should be a Tree' do
    expect(tree.class).to be Tree
  end

  it 'should age' do
    current_age = tree.age
    tree.age!
    new_age = tree.age
    expect(new_age == current_age + 1).to be true
  end

  it 'should grow apples' do
    current_apples = tree.apples.size
    tree.add_apples
    new_apples = tree.apples.size
    expect(current_apples < new_apples).to be true
  end

  it 'should report if the tree has any apples' do
    tree.add_apples
    expect(tree.any_apples?).to be true
  end

  it 'should be able to have apples picked' do
    10.times do
      tree.add_apples
    end
    current_apples = tree.apples.size
    tree.pick_an_apple!
    new_apples = tree.apples.size
    expect(new_apples == current_apples - 1).to be true
  end

  it 'should die after 50 years' do
    51.times do
      tree.age!
    end
    expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
  let(:fruit){Fruit.new}

  it 'should be a Fruit' do
    expect(fruit.class).to be Fruit
  end
end

describe 'Apple' do
  let(:apple){Apple.new('red', 2)}

  it 'should be an Apple' do
    expect(apple.class).to be Apple
  end

  it 'should be red' do
    expect(apple.color == 'red').to be true
  end

  it 'should have diameter 2' do
    expect(apple.diameter == 2).to be true
  end
end
