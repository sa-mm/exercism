defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  
  
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    String.split(word,"", trim: true)
    |> Enum.reduce(0, fn letter, count -> count + Map.get(map_builder, String.upcase(letter), 0) end)
  end
  
  def map_builder do
    val_1 = [["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 1]
    val_2 = [["D", "G"], 2]
    val_3 = [["B", "C", "M", "P"], 3]
    val_4 = [["F", "H", "V", "W", "Y"], 4]
    val_5 = [["K"], 5]
    val_8 = [["J", "X"], 8]
    val_10 = [["Q", "Z"], 10]
    [val_1, val_2, val_3, val_4, val_5, val_8, val_10]
    |> Enum.reduce([], fn list, acc -> acc ++ [map_it(list)] end)
    |> Enum.reduce(%{}, fn map,acc -> Map.merge(map,acc) end)
  end
  
  def map_it(list) do
    Map.new(hd(list), &({&1, Enum.at(list,1)}))
  end
  
end

