defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  
  def nth(0), do: raise ArgumentError
  
  def nth(count) do
    primes = []
    primes_count = 0
    build_primes(2, count, primes, primes_count)
  end
  
  def build_primes(possible_prime, count, primes, primes_count) 
    when primes_count < count do
    cond do
      not_new_prime?(possible_prime, primes) ->
        build_primes(possible_prime + 1, count, primes, Enum.count(primes))
      true ->
        primes = [possible_prime] ++ primes
        build_primes(possible_prime + 1, count, primes, Enum.count(primes))
    end
  end
  
  def build_primes(_, _, primes, _) do
    List.first(primes)
  end
  
  def not_new_prime?(num,previous_primes) do
    Enum.any?(previous_primes, fn prime -> rem(num,prime) === 0 end)
  end

end