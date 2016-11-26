defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  # def compare(a, b) do
  #   cond do
  #     # comparator(a,b,0,a,b) and comparator(b,a,0,b,a) -> :equal
  #     a === b -> :equal
  #     comparator(a,b,0,a,b) -> :sublist
  #     Enum.count(a) > Enum.count(b) and comparator(b,a,0,b,a) -> :superlist
  #     true -> :unequal
  #   end
  # end
  #
  # def comparator([h1|t1],[h2|t2],count,sub,sup) do
  #   if h1 === h2 do
  #     comparator(t1, t2, count, sub,sup)
  #   else
  #     count = count + 1
  #     comparator(sub,Enum.slice(sup,count..Enum.count(sup)),count, sub,sup)
  #   end
  # end
  #
  # def comparator([],_,_,_,_) do
  #   true
  # end
  #
  # def comparator(_,[],_,_,_) do
  #   false
  # end
  
  # def compare(a, b) do
  #   cond do
  #     a === b        -> :equal
  #     sublist?(a, b) -> :sublist
  #     sublist?(b, a) -> :superlist
  #     true           -> :unequal
  #   end
  # end
  #
  # defp sublist?(a, b) when length(a) <= length(b) do
  #   cond do
  #     a === Enum.take(b, length(a)) -> true
  #     true -> sublist?(a, tl(b))
  #   end
  # end
  # defp sublist?(_, _), do: false
  
end


# IO.inspect Sublist.compare([1, 1, 2], [1, 1, 1, 2])
