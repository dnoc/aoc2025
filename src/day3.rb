module Day3
  extend self

  def calculate_max_joltage(batteries)
    max_joltages = batteries.sort
    max_battery = max_joltages.last
    second = max_joltages[-2]

    result = if max_battery == second
      max_battery + second
    elsif batteries.index(max_battery) == batteries.length - 1
      second + max_battery
    elsif batteries.index(max_battery) < batteries.index(second)
      max_battery + second
    else
      after_max = batteries[batteries.index(max_battery)+1..-1].max
      max_battery + after_max
    end

    result.to_i
  end
  
  def get_battery_banks
    lines = File.readlines("#{File.dirname(__FILE__)}/../inputs/day3.txt").map(&:chomp)
    
    lines.map do |l|
      l.split("")
    end
  end

  def main
    banks = get_battery_banks
    
    max_joltage = 0
    banks.each do |batteries|
      max_joltage += calculate_max_joltage(batteries)
      # puts "max_joltage #{calculate_max_joltage(batteries)}"
    end
    
    max_joltage
  end
end