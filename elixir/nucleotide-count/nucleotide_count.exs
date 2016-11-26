defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    
    if nucleotide_check?(nucleotide) && strand_check?(strand) do
      Enum.count(strand, &(&1 == nucleotide))
    else
      raise ArgumentError
    end

  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
      Map.new(@nucleotides, &({&1, DNA.count(strand, &1)}))

  end
  
  @doc """
  Check if it's a valid DNA nucleotide.
  """
  @spec nucleotide_check?(char) :: boolean
  def nucleotide_check?(nucleotide) do
    Enum.member?(@nucleotides, nucleotide)
  end
  
  @doc """
  Check if it's a valid DNA strand.
  """
  @spec strand_check?([char]) :: boolean
  def strand_check?(strand) do
    Enum.all?(strand, &(nucleotide_check?(&1)))
  end
  
end

