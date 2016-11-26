defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  
  @nucleotide_map %{'G' => 'C',
  'C' => 'G',
  'T' => 'A',
  'A' => 'U'}
  
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.reduce(dna, '', fn nuc, acc -> acc ++ Map.get(@nucleotide_map, [nuc]) end)
  end
end