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

  context 'when initialized' do

    it 'should start at 0 years of age' do
      expect(subject.age).to eq 0
    end

    it 'it can start at any year of age specified' do
      object = AppleTree.new(age: 100)
      expect(object.age).to eq 100
    end

    it 'should start with no apples on it' do
      expect(subject.apples.size).to eq 0
    end

  end


  describe '#age!' do
    it 'increases the age by 1' do
      subject.age!
      expect(subject.age).to eq 1
      subject.age!
      expect(subject.age).to eq 2
    end
    it 'increases the height of the tree' do
      expect{subject.age!}.to change{subject.height}.by_at_least(1)
    end
    it 'sometimes grows apples' do
      20.times do
        subject.age!
      end
      expect(subject.apples.size).to eq 0
      20.times do
        subject.age!
      end
      expect(subject.apples.size).to be > 0
      20.times do
        expect{subject.age!}.to change{subject.apples.size}.by(0)
      end
    end
  end

  describe '#add_apples' do
    it 'adds some amount apples' do
      subject.add_apples
      expect(subject.apples.size).to_not eq 0
    end
  end

  describe '#any_apples?' do
    it 'returns false when there are no apples' do
      subject.apples = []
      expect(subject.any_apples?).to be_falsey
    end
    it 'returns true when there are apples' do
      subject.apples = [Apple.new]
      expect(subject.any_apples?).to be_truthy
    end
  end

  describe '#pick_an_apple!' do
    it 'returns an apple if there are apples' do
      subject.add_apples
      object = subject.pick_an_apple!
      expect(object).to be_an Apple
    end
    it 'reduces the amount of apples' do
      subject.add_apples
      expect{subject.pick_an_apple!}.to change{subject.apples.size}.by(-1)
    end
    it 'eventually will lead to a NoApplesError message' do
      subject.apples = 4.times.map{Apple.new}
      4.times do
        subject.pick_an_apple!
      end
      expect{ subject.pick_an_apple! }.to raise_error
    end
  end

  describe '#dead?' do
    it 'trees only last for 60 years' do
      59.times do
        subject.age!
        expect(subject.dead?).to be_falsey
      end
      subject.age!
      expect(subject.dead?).to be_falsey
      subject.age!
      expect(subject.dead?).to be_truthy
    end
  end

end

describe Fruit do
end

describe Apple do
  it 'should have some diameter' do
    expect(subject.diameter).to be > 0
  end
end
