# rubocop:disable Style/CaseEquality
module Enumerable

  def args?(*args)
    raise 'Too many arguments, there should be only one!' if args.length > 1
    return true unless args[0].empty?

    false
  end

  def my_all_argument(argument)
    length.times do |i|
      case argument
      when Class
        next if self[i].is_a?(argument)
      when Regexp
        next if self[i].match(argument)
      else
        next if self[i] == argument
      end
      return false
    end
    true
  end

  def only_true?
    length.times do |i|
      return false unless self[i]
    end
    true
  end

  def my_all?(*args)
    return my_all_argument(args[0]) if args?(args)

    if block_given?
      length.times do |i|
        condition = yield self[i]
        next if condition

        return false
      end
      true

    elsif only_true?
      true
    else
      false
    end
  end

end

# Tests

%w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_all?(/t/) #=> false
[1, 2i, 3.14].my_all?(Numeric) #=> true
[nil, true, 99].my_all? #=> false
[].my_all? #=> true

module Enumerable
  def my_all(argmnt = nil)
    length.times do |value|
      if argmnt.nil? && !block_given?
        matches = value.nil? || !value == true
        break if matches
        !matches
      elsif argmnt.nil?
        matches = yield(value)
        break unless matches
        matches
      elsif argmnt.is_a?(Regexp)
        matches = value.to_s.match?(argmnt)
        break unless matches
        matches
      elsif argmnt.is_a?(Class)
        matches = value.is_a?(argmnt)
        break unless matches
        matches
      else
        matches = value == argmnt
        break unless matches
        matches
      end
    end
  end
end

# tests
%w[ant bear cat].my_all { |word| word.length >= 3 } #=> true
%w[ant bear cat].my_all { |word| word.length >= 4 } #=> false
%w[ant bear cat].my_all(/t/) #=> false
[1, 2i, 3.14].my_all?(Numeric) #=> true
[nil, true, 99].my_all? #=> false
[].my_all? #=> trues