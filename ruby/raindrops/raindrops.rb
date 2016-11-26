class Raindrops
  VERSION = 1
  def self.convert(num)
    num_string = ""
    num_string << "Pling" if (num % 3) == 0
    num_string << "Plang" if (num % 5) == 0
    num_string << "Plong" if (num % 7) == 0
    num_string << num.to_s if num_string.empty?
    num_string
  end
end