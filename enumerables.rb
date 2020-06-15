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

  def my_all?(args = nil)
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

  def my_any?(args = nil)
    i = 0
    while i < length
      if block_given? == true
        return true if yield(self[i])
      elsif args.class == Class
        return true if self[i].class.ancestors.include? args
      elsif args.class == Regexp
        return true if self[i] =~ args
      elsif args.nil? == true
        return true if self[i]
      elsif args[i] == self[i]
        return true
      end
      i += 1
    end
    false
  end

  def my_none?(args = nil)
    i = 0
    while i < length
      if block_given? == true
        return false if yield(self[i])
      elsif args.class == Class
        return false if self[i].class.ancestors.include? args
      elsif args.class == Regexp
        return false if self[i] =~ args
      elsif args.nil? == true
        return false if self[i]
      elsif args[i] == self[i]
        return false
      end
      i += 1
    end
    true
  end

  def my_count(args = nil)
    counter = 0
    if block_given?
      my_each { |x| counter += 1 if yield(x) }
    elsif args
      my_each { |x| counter += 1 if x == args }
    else
      counter = length
    end
    counter
  end
end
