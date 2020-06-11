# rubocop:disable Style/CaseEquality
module Enumerable
  def my_each
    return to_enum if block_given? == false
    x = 0
    while x < length
      yield(self[x])
      x += 1
    end
  end

  def my_each_with_index
    return to_enum if block_given? == false
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    selected = []
    my_each { |x| selected << x if yield(x) }
    selected
  end

  def my_all? (args = nil)
    i = 0
    while i < length
      if block_given? == true
        return false unless yield(self[i])
      elsif args.class == Class
        return false unless self[i].class.ancestors.include? args
      elsif args.class == Regexp
        return false unless self[i] =~ args
      elsif args.nil? == true
        return false unless self[i]
      else
        return false unless args[i] == self[i]
      end
      i += 1
    end
    true
  end

  def my_any?
    # unless block_given?
    # to_enum
    # if block_given?
    # elseif not block_given?
        # add implicit block { |obj| obj }
      # elseif Regex
      # else Class 
    for x in self do
      if yield(x)
        return true
      end  
    end
    false
  end 

  def my_none?
    # if block_given?
# elseif not block_given?
        # add implicit block { |obj| obj }
      # elseif Regex
      # else Class 
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
    # unless block_given?
    # to_enum
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
