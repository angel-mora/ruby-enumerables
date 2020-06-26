# spec/enumerables_tests.rb
require_relative './enumerables.rb'

Class dummy_class
  include Enumerable
end

Rspec.describe dummy_class do

  let(:friends) { %w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc] }
    describe '#my_each' do
      it 'method returns all elements inside an array' do
        expect(friends.my_each).to eql(false)
      end
    end
end
