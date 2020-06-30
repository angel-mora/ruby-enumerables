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
friends.my_select { 'Leo' }

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
%w[ant bear cat].my_none? { |word| word.length == 5 } #=> true
%w[ant bear cat].my_none? { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_none?(/d/) #=> true
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
ary.my_count(&:even?) #=> 3

# my_map test
(1..4).my_map { |i| i * i }
(1..4).my_map { 'cat' }

# my_inject test
numbers.my_inject(:+)
# Sum some numbers
(5..10).my_inject(:+) #=> 45
# Same using a block and inject
(5..10).my_inject { |sum, n| sum + n } #=> 45
# Multiply some numbers
(5..10).my_inject(1, :*) #=> 151200
# Same using a block
(5..10).my_inject(1) { |product, n| product * n } #=> 151200

# multiply_els test
ar = [2, 4, 5]
ar.multiply_els

# PR suggested tests
(1..15).my_all?
(1..15).my_any?
(1..15).my_none?
(1..15).my_count

[1, 1, 1, 1, 1].my_all?

# My each with index Range and Array passed

(1..15).my_each_with_index

hash1 = { font_size: 10, font_family: 'Arial', jimmy: 'timmy' }
hash1.my_each_with_index

%w[cat cat cat].all?('cat')
%w[cat cat cat].my_all?('cat')

%w[cat cat cat].none?('cat')
%w[cat cat cat].my_none?('cat')

%w[cat cat cat].any?('cat')
%w[cat cat cat].my_any?('cat')

(5..10).my_inject(1) # This will drop an error, case added by TSE request

[2, 4, 5].multiply_els
