require_relative 'enumerables.rb'

# Tests file

# Some sample data
friends = %w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc]
numbers = [5, 9, 2, 3, 415, 6, 98]

# my_each test
friends.my_each { |x| puts x }

# my_each_with_index test
friends.my_each_with_index { |x, i| puts "#{x}, #{i}" }

# my_select test
friends.select { |x| 'Leo' }
friends.my_select { |x| 'Leo' }

# my_all? test
%w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_all?(/t/) #=> false
[1, 2i, 3.14].my_all?(Numeric) #=> true
[nil, true, 99].my_all? #=> false
[].my_all? #=> true

# my_any? test
friends.my_any? { |x| x.length >= 3 }

# my_none? test
friends.my_none? { |x| x.length >= 3 }

# my_count test
friends.my_count { |x| x.length == 5 }

# my_map test
friends.my_map { |x| x.reverse }

# my_inject test
numbers.my_inject(:+)

# my_multiply_els test
numbers.my_multiply_els

#########################

module Enumerable

    def my_all? (x)
      if block_given?
        length.times do
          yield (x) unless false
        end
      elsif self == Regexp
        length.times do
          yield unless false
        end
      end  
      true
    end
    
  end
    
  %w[ant bear cat].all?(/a/)
  %w[ant bear cat].my_all?(/a/)
  %w[ant bear cat].my_all? { |x| x.length >= 3 }
  
    
  #try to do as mike and felipe
  
  
