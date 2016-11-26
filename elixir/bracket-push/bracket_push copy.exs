defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  
  @bracket_map %{"{" => 0, "(" => 0, "[" => 0, "}" => 0, ")" => 0, "]" => 0}
  @bracket_pairs %{"{" => "}", "(" => ")", "[" => "]"}
  @bracket_re ~r/[\(\)\{\}\[\]]/
  
  @re2 ~r/(\[)([[:alnum:]]+)\]|(\()([[:alnum:]]+)\)|(\{)([[:alnum:]]+)\}/
  
  @spec check_brackets(String.t) :: boolean
  # @re Regex.compile!([^Regex.escape({}()[])])
  def check_brackets(str) do
    
    cond do
      str == "[]" -> true
      str == "{}" -> true
      str == "()" -> true
      String.match?(str, @re2) -> true
      true -> false
    end
      
    
    # updated_map = String.split(str, "", trim: true)
    # |> Enum.filter(&(Regex.match?(@bracket_re, &1)))
    # |> Enum.reduce(@bracket_map, fn c, map -> Map.update!(map, c, fn val -> val + 1 end) end)
    #
    # Enum.all?(Map.keys(@bracket_pairs), fn bracket -> check_keys(bracket,updated_map) end)

  end
  
  def check_keys(key,map) do
    # cond do
    #   map["("] == map[")"] -> true
    #   map["["] == map["]"] -> true
    #   map["{"] == map["}"] -> true
    #   true -> false
    # end
    # IO.inspect key
    # IO.inspect map[key]
    # IO.inspect map[@bracket_pairs[key]]
    map[key] == map[@bracket_pairs[key]]
  end
  
end

# IO.inspect BracketPush.check_brackets("[]")
# IO.inspect BracketPush.check_brackets("[a]")
# IO.inspect BracketPush.check_brackets("{{")