require 'rspec'
require 'tree'

describe 'Tree' do
  let(:tree) { Tree.new }

  it 'should be a Class' do
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

  it 'should die after 50 years' do
    i=0
    while i<51
      tree.age!
      i +=1
    end

    expect(tree.dead?).to be true
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
