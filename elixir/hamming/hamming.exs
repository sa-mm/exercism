defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    count_em(strand1, strand2, 0)
  end
  
  # def count_em([h | t], [h2 | t2], count) do
  #   cond do
  #     h != h2 -> count_em(t, t2, count + 1)
  #     true -> count_em(t, t2, count)
  #   end
  # end
  
  def count_em([h | t], [h2 | t2], count) when h != h2 do
    count_em(t, t2, count + 1)
  end
  
  def count_em([_ | t], [_ | t2], count) do
    count_em(t, t2, count)
  end
  
  def count_em([], [], count) do
    {:ok, count}
  end
  
  def count_em(strand1, strand2, _) when strand1 != strand2 do
    {:error, "Lists must be the same length"}
  end
  
end