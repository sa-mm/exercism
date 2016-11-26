class Prime
  version = 1
  def self.nth(num)
    pp = 2
    if num == 1
      return pp
    elsif num < 1
      raise ArgumentError
    end
    primes = [pp]
    pp += 1
    primes.push(pp)
    while primes.length < num
      pp += 2
      test = TRUE
      sqrtpp = Math.sqrt(pp)
      primes.each { |x|
        if x > sqrtpp
          break
        end
        if pp % x == 0
          test = FALSE
          break
        end
      }
      if test
        primes.push(pp)
      end
    end
    primes.last
  end
end