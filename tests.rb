require_relative 'enumerables.rb'

# Tests file

# Some sample data
friends = %w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc]
numbers = [5, 9, 2, 3, 415, 6, 98]

# my_each test
friends.my_each { |x| puts x }


friends.my_each_with_index { |x, i| puts "#{x}, #{i}" }
friends.my_select { |x| x != 'Leo' }
friends.my_all? { |x| x.length >= 3 }
friends.my_any? { |x| x.length >= 3 }
friends.my_none? { |x| x.length >= 3 }
friends.my_count { |x| x.length == 5 }
friends.my_map { |x| x.reverse }
numbers.my_inject(:+)
numbers.my_multiply_els
