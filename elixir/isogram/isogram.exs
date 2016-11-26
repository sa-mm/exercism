defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.split("", trim: true)
    |> Enum.filter(fn c -> String.match?(c, ~r/[[:alpha:]]/) end)
    |> check_list
    
  end
  
  def check_list(list) do
    list == Enum.uniq(list)
  end

end