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
friends.select{|x| x != 'Leo'}
friends.my_select { |x| x != 'Leo' }

# my_all? test
friends.my_all? { |x| x.length >= 3 }

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

