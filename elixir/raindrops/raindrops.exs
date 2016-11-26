defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @prime_factors %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    make_string(Map.keys(@prime_factors), number, "")
  end
  
  defp make_string([], number, acc) do
    cond do
      acc == "" -> Integer.to_string(number)
      true -> acc
    end
  end
  
  defp make_string([head | tail], number, acc) do
    cond do
      rem(number,head) === 0 -> make_string(tail, number, acc <> @prime_factors[head])
      true -> make_string(tail, number, acc)
    end
  end
end

