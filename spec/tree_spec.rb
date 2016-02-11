require 'rspec'
require 'tree'

describe 'Tree' do

  before :each do
    @tree = Tree.new
  end

  it 'should be a Class' do
    expect(Tree).to be_a Class
  end

  describe "#new" do
    it "returns a new Tree object" do
      expect(@tree).to be_an_instance_of(Tree)
    end
  end

end

describe 'AppleTree' do

  it 'should be a module' do
    expect(AppleTree).to be_a Module
  end

end


describe 'Fruit' do

  it 'should be a Class' do
    expect(Fruit).to be_a Class
  end

end

describe 'Apple' do

  it 'should be a Class' do
    expect(Apple).to be_a Class
  end

end