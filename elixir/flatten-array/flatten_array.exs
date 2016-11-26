defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    _flatten(list, [])
    |> Enum.reverse
    |> Enum.filter(&(&1 !== nil))
  end
  
  defp _flatten([h|t], acc) do
    acc =
    cond do
      is_list(h) -> _flatten(h, acc)
      true -> [h | acc]
    end
    _flatten(t, acc)
  end
  
  defp _flatten([], acc), do: acc
end
