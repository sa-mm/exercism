defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @bracket_list ["{", "(", "[", "}", ")", "]"]
  @bracket_pairs %{"{" => "}", "(" => ")", "[" => "]"}
  
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    String.split(str, "", trim: true)
    |> Enum.filter(&(is_bracket?(&1)))
    |> track_bracket_pairing([])
  end
  
  def track_bracket_pairing([h | t], next_closed) do
    next_closed = 
      cond do
        right_bracket?(h) -> check_closed_list(h, next_closed)
        true -> next_closed ++ [Map.get(@bracket_pairs, h)]
      end
    track_bracket_pairing(t, next_closed)
  end
  
  # if a bracket has been closed out of order, 
  # return false.
  def track_bracket_pairing(_, [false]) do
    false
  end
  
  # if the list of brackets is empty,
  # check to see if all of the bracket pairs have been closed
  # if not, return false.
  def track_bracket_pairing([], next_closed) do
    cond do
      Enum.count(next_closed) != 0 -> false
      true -> true
    end
  end
  
  #refactor this?
  def check_closed_list(str, list) do
    closed_brackets = ["]", "}", ")"]
      cond do
        Enum.any?(closed_brackets, fn bracket -> 
        str == bracket and List.last(list) == bracket end) -> List.delete_at(list, -1)
        true -> [false]
      end
  end
  
  def right_bracket?(str) do
    String.match?(str, ~r/}|]|\)/)
  end
  
  def is_bracket?(str) do
    re = make_regex(str)
    Enum.any?(@bracket_list, fn bracket -> String.match?(bracket, re) end)
  end
  
  def make_regex(str) do
    re = Regex.escape(str)
    Regex.compile!(re)
  end
  
end

