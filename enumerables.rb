# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/ModuleLength

module Enumerable
  def my_each
    return to_enum unless block_given?

    aux = is_a?(Array) ? self : to_a
    x = 0
    while x < aux.length
      yield(aux[x])
      x += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    aux = is_a?(Array) ? self : to_a
    i = 0
    while i < aux.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected = []
    my_each { |x| selected << x if yield(x) }
    selected
  end

  def my_all?(args = nil)
    aux = is_a?(Array) ? self : to_a
    i = 0
    while i < aux.length
      if block_given? == true
        return false unless yield(aux[i])
      elsif args.class == Class
        return false unless aux[i].class.ancestors.include? args
      elsif args.class == Regexp
        return false unless aux[i] =~ args
      elsif args.nil? == true
        return false unless aux[i]
      else
        return false unless args[i] == aux[i]
      end
      i += 1
    end
    true
  end

  def my_any?(args = nil)
    aux = is_a?(Array) ? self : to_a
    i = 0
    while i < aux.length
      if block_given? == true
        return true if yield(aux[i])
      elsif args.class == Class
        return true if aux[i].class.ancestors.include? args
      elsif args.class == Regexp
        return true if aux[i] =~ args
      elsif args.nil? == true
        return true if aux
      elsif args[i] == aux[i]
        return true
      end
      i += 1
    end
    false
  end

  def my_none?(args = nil)
    aux = is_a?(Array) ? self : to_a
    i = 0
    while i < aux.length
      if block_given? == true
        return false if yield(aux[i])
      elsif args.class == Class
        return false if aux[i].class.ancestors.include? args
      elsif args.class == Regexp
        return false if aux[i] =~ args
      elsif args.nil? == true
        return false if aux[i]
      elsif args[i] == aux[i]
        return false
      end
      i += 1
    end
    true
  end

  def my_count(args = nil)
    aux = is_a?(Array) ? self : to_a
    counter = 0
    if block_given?
      my_each { |x| counter += 1 if yield(x) }
    elsif args
      my_each { |x| counter += 1 if x == args }
    else
      counter = aux.length
    end
    counter
  end

  def my_map(proc = nil)
    return to_enum unless block_given?

    modified = []
    proc ? my_each { |x| modified << proc.call(x) } : my_each { |x| modified << yield(x) }
    modified
  end

  def my_inject(*args)
    if args[0].is_a? Integer
      accumulator = args[0]
      symbol = args[1]
    else
      symbol = args[0]
    end

    if block_given? && args.size == 1
      my_each { |x| accumulator = yield(accumulator, x) }
    elsif args.size == 2
      my_each { |x| accumulator = accumulator.send(symbol, x) }
    elsif block_given?
      my_each { |x| accumulator = accumulator ? yield(accumulator, x) : x }
    else
      my_each { |x| accumulator = accumulator ? accumulator.send(symbol, x) : x }
    end
    accumulator
  end
end

public

def multiply_els
  my_inject(1, :*)
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
