friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun', 'Jean', 'Pedro', 'Keisuke', 'Tláloc']

# playing around with each method
def my_each do
  yield
  p
end

puts friends.each { |friend| puts friend }

puts friends.myeach { |friend| puts friend }


friends.each_with_index {  }
friends.select { |x| puts x != "Leo"}
friends.all? { |x| x.length > 3}
friends.any? 
friends.none?
friends.count
friends.map
friends.inject