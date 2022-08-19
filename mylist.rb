require './myenumerable'

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    i = 0
    while i < @list.length
      yield @list[i]
      i += 1
    end
  end

  def filter(&block)
    @list.select(&block)
  end
end

list = MyList.new(1, 2, 3, 4)
# => #<MyList: @list=[1, 2, 3, 4]>

# Test #all?
puts(list.all? { |e| e < 5 })
# => true
puts(list.all? { |e| e > 5 })
# => false

# Test #any?
puts(list.any? { |e| e == 2 })
# => true
puts(list.any? { |e| e == 5 })
# => false

# Test #filter
puts(list.filter(&:even?))
# => [2, 4]
