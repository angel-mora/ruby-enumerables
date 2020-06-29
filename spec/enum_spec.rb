# spec: enum_spec.rb

require_relative '../enumerables.rb'

describe Enumerable do
  let(:friends) { %w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc] }
  let(:friends_reslt) { %w[sharon leo leila brian arun jean pedro keisuke tláloc] }

  describe '#my_each' do
    context 'when no block is given it returns Enumerable' do
      it '#my_each' do
        expect(friends.my_each).to be_an(friends.to_enum.class)
      end
    end
    context 'when a block is given' do
      it '#my_each' do
        output = []
        friends.my_each { |elem| output << elem.downcase }
        expect(output).to eql(friends_reslt)
      end
    end
  end

  let(:friends2) { %w[Sharon Leo Leila Brian Arun Jean] }
  let(:friends_with_index) { ['Sharon 0', 'Leo 1', 'Leila 2', 'Brian 3', 'Arun 4', 'Jean 5'] }
  describe 'my_each_with_index' do
    context 'when no block is given it returns Enumerable' do
      it '#my_each_with_index' do
        expect(friends2.my_each_with_index).to be_an(friends2.to_enum.class)
      end
    end
    context 'when a block is given' do
      it '#my_each_with_index' do
        output_with_index = []
        friends2.my_each_with_index { |x, i| output_with_index << "#{x} #{i}" }
        expect(output_with_index).to eql(friends_with_index)
      end
    end
  end

  let(:friends_select) { %w[Leo Leila] }
  describe '#my_select' do
    context 'when no block is given it returns Enumerable' do
      it '#my_select' do
        expect(friends.my_each_with_index).to be_an(friends.to_enum.class)
      end
    end
    context 'when a block is given it selects the element that match' do
      it '#my_select' do
        output = friends.my_select { |elem| elem.match(/L/) }
        expect(output).to eql(friends_select)
      end
    end
  end

  let(:array_of_strings) { %w[ant bear cat] }
  let(:eg_range) { (1..15) }
  describe '#my_all?' do
    context 'when object is an array' do
      it '#my_all?' do
        # %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
        output = array_of_strings.my_all? { |word| word.length >= 4 }
        expect(output).to eql(false)
      end
    end
    context 'when object is not an array' do
      # e.g. a Range or a Hash
      it '#my_all?' do
        output = eg_range.my_all? { |x| x > 0 }
        expect(output).to eql(true)
      end
    end
    context 'when a block is given and arguments class is not regexp' do
      # [1, 2i, 3.14].my_all?(Numeric) #=> true
      it '#my_all?' do
        output = [1, 2i, 3.14].my_all?(Numeric)
        expect(output).to eql(true)
      end
    end
    context 'when a block is given and arguments class is regexp' do
      # %w[ant bear cat].my_all?(/t/) #=> false
      it '#my_all?' do
        output = %w[ant bear cat].my_all?(/t/)
        expect(output).to eql(false)
      end
    end
    context 'when no block given, no arguments given and object is an empty array' do
      # [].my_all? #=> true
      it '#my_all?' do
        output = [].my_all?
        expect(output).to eql(true)
      end
    end
    context 'when no block given and no arguments given' do
      # [nil, true, 99].my_all? #=> false
      it '#my_all?' do
        output = [nil, true, 99].my_all?
        expect(output).to eql(false)
      end
    end
  end

end
