defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    str_a = list_to_string(a)
    str_b = list_to_string(b)
    cond do
      is_equal?(str_a,str_b) -> :equal
      is_sublist?(str_a,str_b) -> :sublist
      is_superlist?(str_a,str_b) -> :superlist
      true -> :unequal
    end
  end
  
  def is_equal?(str1,str2) do
    str1 == str2
  end
  
  def is_sublist?(str1, str2) do
    # re = Regex.compile!(str1 <> "(?!\\.)")
    # String.match?(str2, re)
    String.contains?(str2,str1)
  end
  
  def is_superlist?(str1, str2) do
    is_sublist?(str2,str1)
  end
  
  def list_to_string(list) do
    Enum.reduce(list, "", fn element, str ->
      if element == nil do
        str <> "nil"
      else
        str <> to_string(element)
      end
     end)
    # Enum.reduce(list, "", fn element, str -> str <> to_string(element) end)
  end

end

IO.inspect Sublist.compare([1.0],[1.0,2])


# def compare(a, b) do
#   # IO.inspect comparator(a,b,0,a,b)
#   cond do
#     comparator(a,b,0,a,b) and Enum.count(a) == Enum.count(b) -> :equal
#     comparator(a,b,0,a,b) -> :sublist
#     comparator(b,a,0,b,a) and Enum.count(a) > Enum.count(b) -> :superlist
#     true -> :unequal
#   end
#   # IO.puts comparator(a,b,0,a,b)
# end
#
# def comparator([h1|t1],[h2|t2],count,sub,sup) do
#   if h1 === h2 do
#     # IO.puts h1
#     comparator(t1, t2, count, sub,sup)
#   else
#     count = count + 1
#     comparator(sub,Enum.slice(sup,count..Enum.count(sup)),count, sub,sup)
#   end
# end
#
# def comparator([],_,count,sub,sup) do
#   true
# end
#
# def comparator(_,[],count,sub,sup) do
#   false
# end