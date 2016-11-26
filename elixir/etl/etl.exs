defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    input
    |> Map.to_list
    |> Enum.reduce([], fn {old_key, val_list}, acc -> 
      [Enum.reduce(val_list, [], fn word, acc2 -> 
        [{String.downcase(word), old_key} | acc2] 
      end) | acc]
    end)
    |> List.flatten
    |> Map.new
  end
end