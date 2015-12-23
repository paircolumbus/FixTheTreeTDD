require 'rspec'
require 'Tree'

describe Tree do
    let (:tree) {Tree.new}
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
    end
  

  it 'should initialize height, age, apples' do
      expect(tree.height).to eq 0.7
      expect(tree.age).to eq 0
      expect(tree.apples.empty?).to be true
    end
 
describe "age!" do
    it 'should age and grow' do
       tree.age!
       expect(tree.age).to be > 0
       expect(tree.height).to be > 0
    end
end

describe "dead?" do
    it 'kill tree if age exceeds max age' do
        expect(tree.dead?).to be false
    end
end


describe "add_apples" do
     context 'when tree is old enough' do
        it 'should put apples on tree' do
            3.times {tree.age!}
            expect(tree.add_apples).is_a? Integer
        end
    end
 end


describe "any_apples?" do
    context ' no apples until age 3, but....' do
    it 'should return true if there are apples' do
        expect(tree.any_apples?).to be false
    end
  end
end


end


describe AppleTree do
    let(:all_apples) {AppleTree.new}
    it 'should be a subclass of Tree' do
        expect(described_class.ancestors).to include Tree
    end
describe "pick_an_apple!" do
    context 'when there an NO apples' do
        it 'should raise an error' do
            expect{all_apples.pick_an_apple!}.to raise_error NoApplesError
        end
    end
  end
end
 

describe Fruit do
    new_fruit = Fruit.new
    it 'should be a class' do
      expect(described_class.is_a? Class).to be true
    end
    it 'should have seeds' do
        expect(new_fruit.seedy).to be true
    end
end


describe Apple do
    it 'should be a subclass of Fruit' do
        expect(described_class.ancestors).to include Fruit #expecting Apple to be a subclass of Fruit
    end
end

