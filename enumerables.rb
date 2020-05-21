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
    my_each { |x| selected << x if yield(x) }
    puts selected
  end

  def my_all?
    for x in self do
      unless yield(x)
        return false
      end
    end
    true
  end
  
  def my_any?
    for x in self do
      if yield(x)
        return true
      end  
    end
    false
  end 

  def my_none?
    for x in self do
      unless yield(x)
        return true
      end  
    end
    false
  end

  def my_count
    counter = 0
    if block_given?
      for x in self do
        counter += 1 if yield(x)
      end
    else
      counter = length
    end
    counter
  end

  def my_map
    new_array = []
    my_each { |x| new_array.push(yield(x)) }
    new_array
  end

  def my_inject(argument = nil)
    accumulator = nil
    my_each { |item| accumulator = accumulator ? accumulator.send(argument, item) : item }
    accumulator
  end
  # Multiply_els pending

end

# Tests, need to load them in another file
friends = %w[Sharon Leo Leila Brian Arun Jean Pedro Keisuke Tláloc]
numbers = [5, 9, 2, 3, 415, 6, 98]

friends.my_each { |x| puts x }
friends.my_each_with_index { |x, i| puts "#{x}, #{i}" }
friends.my_select { |x| x != 'Leo' }
friends.my_all? { |x| x.length >= 3 }
friends.my_any? { |x| x.length >= 3 }
friends.my_none? { |x| x.length >= 3 }
friends.my_count { |x| x.length == 5 }
friends.my_map { |x| x.reverse }
numbers.my_inject(:+)
