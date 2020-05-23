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
      # if block_given?
      unless yield(x)
        return false
      end
      # else if not block_given?
        # add implicit block { |obj| obj }
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

  def my_multiply_els
    my_inject(:*)
   end

end
