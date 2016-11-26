class Pangram
  VERSION = 1
  def self.is_pangram?(str)
    # return false if str == ''
    alphabet = Array('a'..'z')
    # puts str.gsub(/\W+/, '').downcase.chars.uniq.sort
    alphabet.length.times do |i|
     return false if (str.gsub(/\W+/, '').downcase.chars.uniq.sort[i] != alphabet[i])
    end
    true
  end
end

#str.encode(Encoding.find('ASCII'), :replace => '',)
