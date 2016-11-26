class Pangram
  VERSION = 1
  def self.is_pangram?(str)
    ans = Array('a'..'z') - str.downcase.chars
    ans.empty?
  end
end

#nice