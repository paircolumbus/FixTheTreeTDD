require 'rspec'
require 'tree'

describe 'Tree' do
  let(:tree) {Tree.new}
  it 'should be a Class' do
    expect(tree.is_a? Tree).to be true
  end

  it 'should have an age of 0' do
    expect(tree.age).to eq 0 
  end
  
  it 'should have a height of 0' do
    expect(tree.height).to eq 0 
  end

  it 'should have no apples' do
    expect(tree.apples.count).to eq 0 
  end

  it 'should be alive' do 
    expect(tree.alive).to eq true
  end

  context 'aging' do
    it 'should increment age' do
      tree.age!
      expect(tree.age).to eq 1
    end

    it 'should increment height' do
      tree.age!
      expect(tree.height).to eq 3
    end

    it 'should no grow apples' do
      tree.age!
      expect(tree.apples.count).to eq 0 
    end

    it 'should die before 100' do
      100.times {tree.age!}
      expect(tree.dead?).to be true 
    end

    it 'should not die before 50' do
      49.times {tree.age!}
      expect(tree.alive).to be true
    end

    it 'should grow 1 unit after 15' do
      15.times{tree.age!}
      height = tree.height
      tree.age!
      expect(tree.height-height).to eq 1
    end

    it 'should grow apples after 10 years' do
      11.times{tree.age!}
      expect(tree.any_apples?).to be true
    end
  end

  context 'picking apples'
    it 'should remove one apple' do
      11.times{tree.age!}
      num_apples = tree.apples.count
      tree.pick_an_apple!
      expect(num_apples-tree.apples.count).to eq  1
    end
end

describe 'Fruit' do
  let(:fruit) {Fruit.new}

  it 'should be a fruit' do
    expect(fruit.is_a? Fruit).to be true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds).to be true
  end

end

describe 'Apple' do
  let(:apple) {Apple.new('red', 10)}

  it 'should be an apple' do
    expect(apple.is_a? Apple).to be true
  end

  it 'should inherit from fruit' do
    expect(apple.is_a? Fruit).to be true
  end

  it 'should be red' do
    expect(apple.color).to eq "red"
  end

  it 'should have a diameter of 10' do
    expect(apple.diameter).to eq 10
  end


end
