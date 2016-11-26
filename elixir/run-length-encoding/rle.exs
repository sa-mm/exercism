defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
      String.split(string, "", trim: true)
      |> _encode
      |> List.to_string
  end
  
  @spec decode(String.t) :: String.t
  def decode(string) do
      String.split(string, "", trim: true)
      |> _decode
      |> List.to_string 
  end
  
  def _encode(list,count \\ 1)
  
  def _encode([], _) do
      []
  end
  
  def _encode([head | tail], count) do
      first_tail = List.first(tail)
      cond do
          head == first_tail -> _encode(tail, (count + 1))
          true -> [Integer.to_string(count), head] ++ _encode(tail, 1)
      end
  end
  
  def _decode(list, count_str \\ "")
  
  def _decode([], _) do
      []
  end
  
  def _decode([head | tail], count_str) do
      cond do
        is_alpha?(head) -> [repeat_it(head,count_str)] ++ _decode(tail, "")
        true -> _decode(tail, count_str <> head)
      end
  end
  
  def is_alpha?(string) do
      String.match?(string, ~r/[[:alpha:]]/) 
  end
  
  def repeat_it(string,count_str) do
      String.duplicate(string, String.to_integer(count_str))
  end
end
