defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l,0)
  end
  
  defp _count([_|t], acc), do: _count(t, acc + 1)
  defp _count([], acc), do: acc

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l,[])
  end
  
  defp _reverse([h|t],acc), do: _reverse(t,[h | acc])
  defp _reverse([],acc), do: acc

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l,f,[])
  end
  
  defp _map([h|t], fun, acc), do: _map(t, fun, [fun.(h) | acc])
  defp _map([], _, acc), do: ListOps.reverse(acc)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f, [])
  end
  
  defp _filter([h|t], fun, acc) do
    acc = 
    cond do
      fun.(h) -> [h | acc]
      true -> acc
    end
    _filter(t, fun, acc)
  end
  
  defp _filter([], _, acc) do
    ListOps.reverse(acc)
  end
  
  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end
  
  defp _reduce([h|t], acc, fun), do: _reduce(t, fun.(h, acc), fun)
  defp _reduce([], acc, _fun), do: acc

  @spec append(list, list) :: list
  def append(a, b) do
    _append(ListOps.reverse(a), b)
  end
  
  def _append([h|t], b), do: _append(t, [h | b])
  def _append([], b), do: b

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ListOps.reduce(ll, [], fn item, acc -> ListOps.append(ListOps.reverse(item),acc) end)
    |> ListOps.reverse
  end
end