class Complement
  VERSION = 3
  def self.of_dna(dna)
    dna_array = dna.chars
    rna_array = []
    dna_array.each do |nucleotide|
      case nucleotide
      when "C"
        rna_array.push("G")
      when "G"
        rna_array.push("C")
      when "T"
        rna_array.push("A")
      when "A"
        rna_array.push("U")
      else
        raise ArgumentError
      end
    end
    rna_string = rna_array.join
  end
end