defmodule Bob do
  def hey(input) do
    cond do
        String.ends_with?(input, "?") -> "Sure."
        String.trim(input) == "" -> "Fine. Be that way!"
        all_upcase?(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
  
  @spec all_upcase?(String.t()) :: boolean
  def all_upcase?(input_string) do
    String.match?(input_string, ~r/^[^a-z]+$/) && String.match?(input_string, ~r/\p{L}+/)
    # because I don't know how to get the regex correct…
    # The second match is a better than /[A-Z]+/
  end
  
end




