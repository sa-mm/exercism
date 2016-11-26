module Name
  def nombre
    # name = ""
    # letters = [*'A'..'Z']
    # letters = Array.new(2){ letters.sample }.join
    # numbers = [*'0'..'9']
    # numbers = Array.new(3){ numbers.sample }.join
    # name = letters << numbers
    # name = (Array('A'..'Z').sample(2) + Array(0..9).sample(3)).join
    name = ['Sam', 'Yufen'].sample
  end
end

class Robot
  include Name
  TAKEN_NAMES = Array.new
  def initialize
    @name = nombre
  end
  
  def name
    # if @name != @taken_names[@name]
    #   @taken_names[@name] = true
    #   @name
    # else
    #   reset
    # end
    # @name
    
    if TAKEN_NAMES.include?(@name)
      puts "if statement true:"
      puts TAKEN_NAMES
      puts @name
      reset
    else
      puts "if statement false:"
      puts TAKEN_NAMES
      puts @name
      TAKEN_NAMES.push(@name)
      @name
    end
    # loop do
    #   unless @taken_names[@name]
    #     @taken_names[@name] = true
    #     break @name
    #   end
    # end
    
  end
  def reset
    @name = nombre
  end
end

=begin
  TODO Add check for name equality.
=end

robot = Robot.new
name1 = robot.name
puts name1

robot.reset
name2 = robot.name
puts name2