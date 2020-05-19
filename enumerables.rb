module Enumerable
  def my_each
    x = 0
    while x < length
      yield(self[x])
      x += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    selected = []
    self.my_each { |x| selected << x if yield(x) }
    puts selected
  end

end

#tests
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun', 'Jean', 'Pedro', 'Keisuke', 'Tláloc']
numbers = [5, 9, 2, 3, 415, 6, 98]

# friends.my_each { |x| puts x }
# friends.my_each_with_index { |x, i| puts " #{x}, #{i}" }
friends.my_select { |x| x != "Leo" }

