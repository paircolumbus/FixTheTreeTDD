require 'rspec'
require 'tree'
require 'pry'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should be a subclass of Tree' do
    expect(described_class < Tree).to eq true
  end

  subject do
    AppleTree.new
  end

  context 'when initialized' do

    it 'should start at 0 years of age' do
      expect(subject.age).to eq 0
    end

    it 'it can start at any year of age specified' do
      object = AppleTree.new(age: 100)
      expect(object.age).to eq 100
    end

  end


  describe '#age!' do
    it 'increases the age by 1' do
      subject.age!
      expect(subject.age).to eq 1
      subject.age!
      expect(subject.age).to eq 2
    end
  end

end

describe 'Fruit' do
end

describe 'Apple' do
end
