defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) do
    cond do
      has_nonpositive_sides?(a,b,c) -> {:error, "all side lengths must be positive"}
      violates_triangle_inequality?(a,b,c) -> { :error, "side lengths violate triangle inequality" }
      is_equilateral?(a,b,c) -> {:ok, :equilateral}
      is_isosceles?(a,b,c) -> {:ok, :isosceles}
      is_scalene?(a,b,c) -> {:ok, :scalene}
    end
  end
  
  def is_equilateral?(a,b,c) do
    a === b and a === c
  end
  
  def is_isosceles?(a,b,c) do
    a === b or a === c or b === c
  end

  def is_scalene?(a,b,c) do
    a !== b and a !== c and b !== c
  end
  
  def has_nonpositive_sides?(a,b,c) do
    a <= 0 or b <= 0 or c <= 0
  end
  
  def violates_triangle_inequality?(a,b,c) do
    list = Enum.sort([a,b,c])
    |> Enum.reverse
    hd(list) >= Enum.sum(tl(list))
  end
end