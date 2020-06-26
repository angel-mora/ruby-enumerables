# spec/enumerables_tests.rb
require_relative '../enumerables'

describe Enumerable do
  include Enumerable
  let(:friends) { %w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc] }
    describe '#my_each' do
      it 'method returns all elements inside an array' do
        expect(friends.my_each { |x| puts x } ).to eql(["Sharon", "Leo", "Leila", "Brian", "Arun", "Jean", "Pedro", "Keisuke", "Tláloc"])
      end
    end
end
