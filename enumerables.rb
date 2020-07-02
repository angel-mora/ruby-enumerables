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
        return false unless aux[i]
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
      else
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
      else
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

  # def my_inject(*args)
  #   if args[0].is_a? Integer
  #     accumulator = args[0]
  #     symbol = args[1]
  #   else
  #     symbol = args[0]
  #   end

  #   if block_given? && args.size == 1
  #     my_each { |x| accumulator = yield(accumulator, x) }
  #   elsif args.size == 2
  #     my_each { |x| accumulator = accumulator.send(symbol, x) }
  #   elsif block_given?
  #     my_each { |x| accumulator = accumulator ? yield(accumulator, x) : x }
  #   elsif block_given? == false
  #     my_each { |x| accumulator = accumulator ? yield(accumulator, x) : x }
  #   else
  #     my_each { |x| accumulator = accumulator ? accumulator.send(symbol, x) : x }
  #   end
  #   accumulator
  # end

  def my_inject(*parameter) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/AbcSize
    return 'wrong number of arguments' unless parameter.size <= 2

    output_array = is_a?(Array) ? self : to_a
    my_symbol = nil
    my_initial = nil
    parameter.each do |elem|
      if elem.is_a?(Symbol)
        my_symbol = elem
      else
        my_initial = elem
      end
    end

    if !my_symbol.nil? && !my_initial.nil?
      cumulator = my_initial
      each do |elem|
        cumulator = cumulator.send(my_symbol, elem)
      end
    elsif !my_symbol.nil? && my_initial.nil?
      cumulator = output_array[0]
      i = 1
      while i < size
        cumulator = cumulator.send(my_symbol, output_array[i])
        i += 1
      end
    elsif my_symbol.nil? && !my_initial.nil? && block_given?
      cumulator = my_initial
      each do |elem|
        cumulator = yield cumulator, elem
      end
    elsif my_symbol.nil? && !my_initial.nil? && !block_given?
      return "error #{my_initial} not a symbol and no block is given"
    elsif my_symbol.nil? && my_initial.nil? && block_given?
      cumulator = output_array[0]
      i = 1
      while i < size
        cumulator = yield cumulator, output_array[i]
        i += 1
      end
    else my_symbol.nil? && my_initial.nil? && !block_given?
         return to_enum(:my_inject)
    end
    cumulator
  end
end

# public

# def multiply_els
#   inject(1) { |product, n| product * n }
# end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/ModuleLength
