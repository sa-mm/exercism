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
    ROMAN_NUMERALS.keys.each do |arabic_int|
      while n >= arabic_int
        roman_num << ROMAN_NUMERALS[arabic_int]
        n -= arabic_int
      end
    end
    return roman_num
  end
end


# based on http://exercism.io/submissions/2ce284dff7fe465a8ee10a8ddcac02b9