defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  
  def generate(_, []) do
      :error
  end
  
  def generate(amount, values) do
      change_map = Enum.reduce(values,%{},fn(x,map) ->
        Map.update(map,x,0,&(&1))
      end)
      sorted_values = Enum.sort(values, &(&1 > &2))
      {a,b} = relevant_change(amount,sorted_values,change_map)
    # {a,b} = map
    if a == :error do
        # {a,b}
        a
    else
        {a, b}
    end
  end
  
  def relevant_change(0, [], change_map) do
      {:ok, change_map}
  end
  
  def relevant_change(amount, [], change_map) 
  when amount > 0 do
      {:error, change_map}
  end
  
  def relevant_change(amount, [head | tail], change_map) 
  when amount - (head * 2) >= 0 do
      reduced_amount = amount - head
      change_map = Map.update(change_map, head, 1, &(&1 + 1))
      relevant_change(reduced_amount, [head | tail], change_map)
  end
  
  def relevant_change(amount, [head | tail], change_map) 
  when amount - head >= 0 do
      reduced_amount = amount - head
      if divisible_any?(reduced_amount, tail) || amount - head == 0 do
          change_map = Map.update(change_map, head, 1, &(&1 + 1))
          relevant_change(reduced_amount, tail, change_map)
      else
          relevant_change(amount, tail, change_map)
      end
  end
  
  def relevant_change(amount, [_ | tail], change_map) do
      relevant_change(amount, tail, change_map)
  end
  
  def divisible_any?(num, list) do
      Enum.any?(list, fn(item) -> rem(num,item) == 0 end)
  end
end
