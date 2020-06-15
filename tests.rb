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
friends.my_select { |x| 'Leo' }

# my_all? test
%w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_all?(/t/) #=> false
[1, 2i, 3.14].my_all?(Numeric) #=> true
[nil, true, 99].my_all? #=> false
[].my_all? #=> true

# my_any? test
%w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].my_any?(/d/) #=> false
[nil, true, 99].my_any?(Integer) #=> true
[nil, true, 99].my_any? #=> true
[].my_any? #=> false

# my_none? test
%w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
%w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
%w{ant bear cat}.my_none?(/d/) #=> true
[1, 3.14, 42].my_none?(Float) #=> false
[].my_none? #=> true
[nil].my_none? #=> true
[nil, false].my_none? #=> true
[nil, false, true].my_none? #=> false

# my_count test
friends.my_count { |x| x.length == 5 }
ary = [1, 2, 4, 2]
ary.my_count #=> 4
ary.my_count(2) #=> 2
ary.my_count{ |x| x % 2 == 0 } #=> 3

# my_map test
friends.my_map { |x| x.reverse }

# my_inject test
numbers.my_inject(:+)

# my_multiply_els test
numbers.my_multiply_els
