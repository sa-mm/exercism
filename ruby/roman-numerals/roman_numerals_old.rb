class Fixnum
  VERSION = 1
  ROMAN_NUMERALS = {
    1000 => "M",  
     900 => "CM",  
     500 => "D",  
     400 => "CD",
     100 => "C",  
      90 => "XC",  
      50 => "L",  
      40 => "XL",  
      10 => "X",  
        9 => "IX",  
        5 => "V",  
        4 => "IV",  
        1 => "I",  
  }

  def to_roman
    n = self
    roman_num = ""
    ROMAN_NUMERALS.each do |arabic_int, capital_letter|
      roman_num << capital_letter * (n / arabic_int)
      n = n % arabic_int
    end
    return roman_num
  end
end

# too difficult.