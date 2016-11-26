class Year
  def self.leap?(n)
    case 0
    when n % 400
      true
    when n % 100
      false
    when n % 4
      true
    else
      false
    end
  end
end

module BookKeeping
  VERSION = 2
end