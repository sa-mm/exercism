defmodule Grains do
    use Bitwise
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
       1 <<< (number - 1)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    #   1..64
    #   |> Enum.reduce(0, fn(x,acc) -> square(x) + acc end)
      square(65) - 1
  end
end
