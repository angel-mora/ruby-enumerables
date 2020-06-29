# spec: enum_spec.rb

require_relative '../enumerables.rb'

describe Enumerable do
  let(:friends) {%w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc]}
  let(:friends_reslt) {%w[sharon leo leila brian arun jean pedro keisuke tláloc]}
  describe '#my_each' do 
    context 'when no block is given it returns Enumerable' do
      it '#my_each' do
        expect(friends.my_each).to be_an(friends.to_enum.class)
      end
    end
    context 'when a block is given ' do
      it '#my_each' do
        output = []
        friends.my_each {|elem| output << elem.downcase}
        expect(output).to eql(friends_reslt)
      end
    end
  end
end
