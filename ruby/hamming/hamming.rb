class Hamming
  def self.compute(strand_one, strand_two)
    distance = 0
    count = strand_one.length
    if count == strand_two.length
      count.times do |n|
        distance += 1 if strand_one.chars[n] != strand_two.chars[n]
      end
      distance
    else
      raise ArgumentError.new("The strands are not the same length.")
    end
  end
  VERSION = 1
end