# spec: enum_test.rb

require_relative './enumerables.rb'

Rspec.describe Enumerable do 
  describe '#my_each' do 
    it 'returns arrays elements' do
      expect(true).to eql(false)
    end
  end
end
