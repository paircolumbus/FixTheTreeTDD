require 'rspec'
require 'tree'

describe 'Tree' do

  it 'should be a Class' do
    expect(Tree).to be_a Class
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