module Day7
  extend self

  def get_lines
    File.readlines("#{File.dirname(__FILE__)}/../inputs/day7.txt").map(&:chomp)
  end

  def get_beam_positions(line, index)
    if line[index] == "."
      [index]
    elsif line[index] == "^"
      [index - 1, index + 1]
    end
  end

  def part_1
    lines = get_lines

    start = lines.first.index('S')

    beams = [start]
    number_of_splits = 0

    lines.each_with_index do |line, index|
      next if index == lines.size - 1

      new_beams = []

      beams.each do |b|
        positions = get_beam_positions(lines[index+1], b)
        number_of_splits += 1 if positions.size > 1
        new_beams.concat(positions)
      end

      beams = new_beams.uniq
      # puts beams.inspect
    end

    number_of_splits
  end

  def part_2
    lines = get_lines

    number_of_beams_per_column = []

    lines.each_with_index do |line, index|
      next if index == lines.size - 1


      if index == 0
        line.split("").each_with_index do |column, i|
          if column == 'S'
            number_of_beams_per_column << 1
          else
            number_of_beams_per_column << 0
          end
        end
      end

      lines[index+1].split("").each_with_index do |column, i|
        if column == '^'
          number_of_beams_per_column[i - 1] += number_of_beams_per_column[i]
          number_of_beams_per_column[i + 1] += number_of_beams_per_column[i]
          number_of_beams_per_column[i] = 0
        end
      end
      
      # puts number_of_beams_per_column.inspect
      # puts "line #{index} done"
    end

    number_of_beams_per_column.sum
  end
end