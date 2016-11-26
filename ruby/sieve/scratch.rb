class Sieve
  def initialize(lim)
    @lim = lim
    @numbers = []
    for i in 2 .. @lim
      @numbers[i] = i
    end
  end
  
  def primes
    sieve = @numbers
    for i in 2 .. Math.sqrt(@lim)
      next unless sieve[i]
      (i*i).step(@lim, i) do |j|
        sieve[j] = nil
      end
    end
    sieve.compact
  end

end

puts Sieve.new(10).primes
