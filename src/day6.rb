module Day6
  extend self

  def get_lines
    full_lines = File.readlines("#{File.dirname(__FILE__)}/../inputs/day6.txt").map(&:chomp)
    full_lines.map { |line| line.split(" ") }
  end

  def part_1_solutions(lines)
    solutions = []
      
    lines.last.size.times do |i|
      if lines.last[i] == "+"
        answer = 0
        lines[0..-2].each { |x| answer += x[i].to_i }
        solutions << answer
      elsif lines.last[i] == "*"
        answer = 1
        lines[0..-2].each { |x| answer *= x[i].to_i }
        solutions << answer
      end
    end

    solutions
  end

  def read_file
    File.readlines("#{File.dirname(__FILE__)}/../inputs/day6.txt").map(&:chomp)
  end

  def get_problems
    full_lines = read_file
    length = full_lines.last.size
    problems = []
    problem = []

    length.times do |i|
      index = length - (i+1)

      unless full_lines.all? { |l| l[index] == " " }
        number = ""
        full_lines[0..-2].each do |line|
          unless line[index].nil?
            number += line[index]
          end
        end
        problem << number.to_i

        if full_lines.last[index] == "+" || full_lines.last[index] == "*"
          problem << full_lines.last[index]
          problems << problem
          problem = []
        end
      end
    end

    problems
  end

  def part_2_solutions
    # problems = [123, 123, 123, "+"]

    problems = get_problems

    # puts problems.inspect
    problems.map do |p|
      if p.last == "+"
        p[0..-2].sum
      elsif p.last == "*"
        answer = 1
        p[0..-2].each { |x| answer *= x }
        answer
      end
    end
  end

  def main
    # lines = get_lines
    # raise StandardError("lines are not the same size") if lines.any? { |l| l.size != lines.last.size }
    # solutions = part_1_solutions(lines)

    solutions = part_2_solutions
    
    solutions.sum
  end
end