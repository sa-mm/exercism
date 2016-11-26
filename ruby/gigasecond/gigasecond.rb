class Gigasecond
  VERSION = 1
  def self.from(time_in_utc)
    time_in_utc + (10**9)
  end
end