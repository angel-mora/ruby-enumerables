module Enumerable
  def my_each
    for x in self do
      yield(x)
    end
  end
end
