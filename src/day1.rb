module Day1
  extend self

  def move_dial(position, direction, distance)
    if direction == "L"
      position -= distance
    else
      position += distance
    end
    
    position = position % 100
    if position < 0
      100 - position
    else
      position
    end
  end

  def count_zeroes_passed(position, direction, distance)
    zeroes_passed = 0
    if distance > 100
      zeroes_passed = distance / 100
    end

    if position != 0
      if direction == 'R' && (distance % 100) + position > 99
        zeroes_passed += 1
      end

      if direction == 'L' && position - (distance % 100) < 1
        zeroes_passed += 1
      end
    end

    # if zeroes_passed > 0
    #   puts "passed zero #{zeroes_passed} times, starting at #{position}, rotating #{direction}#{distance}"
    # end

    zeroes_passed
  end
  
  def get_commands
    lines = File.readlines("#{File.dirname(__FILE__)}/../inputs/day1.txt").map(&:chomp)
    
    lines.map do |l|
      {
        direction: l[0],
        distance: l[1..].to_i
      }
    end
  end

  def main
    commands = get_commands
    
    position = 50
    zeroes_passed = 0
    commands.each do |command|
      zeroes_passed += count_zeroes_passed(position, command[:direction], command[:distance])
      position = move_dial(position, command[:direction], command[:distance])
    end
    
    {
      position: position,
      zeroes_passed: zeroes_passed
    }
  end
end