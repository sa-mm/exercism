defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &(is_different?(&1,base)))
    |> Enum.reduce([], fn word, acc -> acc ++ [%{sort_word(word) => word}] end)
    |> Enum.reduce([], fn mapped_candidate, acc -> acc ++ matches(sort_word(base), mapped_candidate) end)

  end
  
  #return matches
  def matches(string,map) do
    cond do
      map[string] -> [map[string]]
      true -> []
    end
  end
  
  def sort_word(string) do
    String.split(String.downcase(string),"", trim: true)
    |> Enum.sort
    |> List.to_string
  end
  
  def is_different?(candidate,base) do
    String.downcase(candidate) != String.downcase(base)
  end
end