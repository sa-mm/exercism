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
      |> Enum.reduce([], fn letter, acc -> list_builder(letter, acc) end)
      |> Enum.reduce([], fn item, acc -> 
        acc ++ [Integer.to_string(item.count) <> item.letter]
        end)
      |> List.to_string
  end
  
  defp list_builder(letter, acc) when acc == [] do
    acc ++ [%{count: 1, letter: letter}]
  end
  
  defp list_builder(letter, acc) do
    cond do
      List.last(acc).letter == letter -> List.update_at(acc, -1, fn map -> %{count: List.last(acc).count + 1, letter: letter} end)
      true -> acc ++ [%{count: 1, letter: letter}]
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    String.split(string, "", trim: true)
    |> decoder([])
    |> List.to_string
  end
  
  @spec decoder(List.t, List.t) :: list
  defp decoder([head | tail], acc) do
    first_tail = List.first(tail)
    cond do
      another_digit?(first_tail) -> decoder(update_tail(head, tail), acc)
      an_alpha?(first_tail) -> decoder(List.delete_at(tail, 0), update_acc(head, first_tail, acc)) #the fact that I'm using delete_at on the tail makes me think I'm approaching this incorrectly. reverse?
      true -> acc #necessary?
    end
  end
  
  @spec decoder(List.t, List.t) :: list
  defp decoder([], acc) do
    acc
  end
  
  # Checks if a given string is a digit.
  @spec another_digit?(String.t) :: boolean
  defp another_digit?(string) do
    String.match?(string, ~r/[0-9]/)  
  end
  

  # Checks if a given string is a letter.
  @spec an_alpha?(String.t) :: boolean
  defp an_alpha?(string) do
    String.match?(string, ~r/[A-Z]/)
  end
  
  @spec update_tail(String.t, List.t) :: list
  defp update_tail(head, tail) do
    List.update_at(tail, 0, &(head <> &1))
  end
  
  @spec update_acc(String.t, String.t, List.t) :: list
  defp update_acc(digit, string, acc) do
    acc ++ [String.duplicate(string, String.to_integer(digit))]
  end
  
end