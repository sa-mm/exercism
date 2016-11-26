defmodule Roman do
  
  @roman_1 %{0 => "", 1 => "I", 2 => "II", 3 => "III", 4 => "IV", 5 => "V", 6 => "VI", 7 => "VII", 8 => "VIII", 9 => "IX"}
  
  @roman_2 %{0 => "", 1 => "X", 2 => "XX", 3 => "XXX", 4 => "XL", 5 => "L", 6 => "LX", 7 => "LXX", 8 => "LXXX", 9 => "XC"}
  
  @roman_3 %{0 => "", 1 => "C", 2 => "CC", 3 => "CCC", 4 => "CD", 5 => "D", 6 => "DC", 7 => "DCC", 8 => "DCCC", 9 => "CM"}
  
  @roman_4 %{0 => "", 1 => "M", 2 => "MM", 3 => "MMM"}
  
  @romans %{1 => @roman_1, 2 => @roman_2, 3 => @roman_3, 4 => @roman_4}
  
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    num_list = number
    |> Integer.to_string
    |> String.split("", trim: true)
    build_roman(num_list, Enum.count(num_list), "")
  end
  
  def build_roman([head | tail], length, acc) do
    head = String.to_integer(head)
    acc = acc <> @romans[length][head]
    build_roman(tail, length - 1, acc)
  end
  
  def build_roman([], _, acc) do
    acc
  end

end