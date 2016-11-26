class Sieve
  def initialize(lim)
    @lim = lim
    @numbers = (2..@lim).to_a
  end
  
  def primes
    sieve = [nil,nil].concat(@numbers)
    (2..Math.sqrt(@lim)).each do |i|
      (i**2..@lim).step(i) { |m| sieve[m] = nil} if sieve[i]
    end
    sieve.compact
  end
end

