class Squares
  VERSION = 2
  def initialize(num)
    @num = num
  end
  def square_of_sum
    sum = 0
    (@num + 1).times { |n| sum += n }
    sum ** 2
  end
  def sum_of_squares
    sum = 0
    (@num + 1).times { |n| sum += (n ** 2) }
    sum
  end
  def difference
    square_of_sum - sum_of_squares
  end

end

# assumes the natural numbers don't include 0?