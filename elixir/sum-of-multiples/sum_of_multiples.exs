defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.reduce(factors, [], &(multiplier(&1,1,limit,&2)))
    |> Enum.uniq
    |> Enum.reduce(0, &(&1 + &2))

  end
  
  def multiplier(num,count,limit,acc) when (num * count) < limit do
    acc = acc ++ [num * count]
    multiplier(num,count + 1,limit,acc)
  end
  
  def multiplier(_,_,_,acc) do
    acc
  end
end