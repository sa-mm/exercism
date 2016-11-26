defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  
  def verse(1) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end
  def verse(2) do
    # Your implementation here...
    b_num = 2 - 1
    """
    #{b_num} bottle of beer on the wall, #{b_num} bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end
  
  def verse(3) do
    b_num = 3 - 1
    """
    #{b_num} bottles of beer on the wall, #{b_num} bottles of beer.
    Take one down and pass it around, #{b_num - 1} bottle of beer on the wall.
    """
  end
  
  def verse(number) do
    # Your implementation here...
    b_num = number - 1
    """
    #{b_num} bottles of beer on the wall, #{b_num} bottles of beer.
    Take one down and pass it around, #{b_num - 1} bottles of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    Enum.reduce(range, "", fn number, acc -> acc <> verse(number) <> "#{if number > 1, do: "\n"}" end)
    # Enum.reduce(range, [], fn number, acc -> acc ++ [verse(number), "\n"] end)
    # |> List.delete_at(-1)
    # |> List.to_string
  end
end