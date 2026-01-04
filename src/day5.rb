module Day5
  extend self

  def part_1(fresh_ids, ingredient_ids)
    filtered = ingredient_ids.filter do |id|
      fresh_ids.any? do |range|
        id >= range[0] && id <= range[1]
      end
    end
    
    # puts filtered.inspect
    filtered.size
  end

  def reduce_ranges(a, id_range)
    clone = id_range.dup
    
    id_range.each do |b|
      if a == b || b.nil? || a[0] > b[1] || a[1] < b[0] # exclusive, equal, nil
        next
      elsif a[0] >= b[0] && a[1] <= b[1] # b overlaps a
        clone.delete(a)
        a = b
      elsif b[0] >= a[0] && b[1] <= a[1] # a overlaps b
        clone.delete(b)
      elsif a[0] < b[0] && a[1] >= b[0] && a[1] <= b[1] # a ends in b
        a[1] = b[1]
        clone.delete(b)
      elsif a[0] >= b[0] && a[0] <= b[1] && a[1] > b[1] # a starts in b
        a[0] = b[0]
        clone.delete(b)
      elsif a[1] == (b[0] - 1) # a ends just before b
        a[1] = b[1]
        clone.delete(b)
      elsif b[1] == (a[0] - 1) # b ends just before a
        a[0] = b[0]
        clone.delete(b)
      end
    end

    clone
  end

  def part_2(fresh_ids)
    # Find and reduce overlaps
    ranges_without_overlaps = fresh_ids.dup.sort { |x,y| x[0] <=> y[0] }.uniq
    index = 0
    while index < fresh_ids.size
      a = ranges_without_overlaps[index]

      if a.nil?
        break
      end
      
      reduced = reduce_ranges(a, ranges_without_overlaps)

      if reduced.size == ranges_without_overlaps.size
        index += 1
      else
        ranges_without_overlaps = reduced
        index = 0
      end
    end

    number_ids_per_range = ranges_without_overlaps.uniq.map do |range|
      range[1] - range[0] + 1 # inclusive
    end

    # tester = ranges_without_overlaps.dup.sort { |x,y| x[0] <=> y[0] }
    # puts "ranges_without_overlaps sorted check: #{ranges_without_overlaps == tester}"
    # ranges_without_overlaps.each_with_index do |range, index|
    #   if range[0] == range[1]
    #     puts "Equals: #{range.inspect}"
    #   elsif range[0] > range[1]
    #     puts "Inverted: #{range.inspect}"
    #   elsif !ranges_without_overlaps[index+1].nil? && range[1] > ranges_without_overlaps[index+1][0]
    #     puts "Overlaps next: #{range.inspect} > #{ranges_without_overlaps[index+1].inspect}"
    #   end
    # end

    number_ids_per_range.sum
  end

  def read_file
    lines = File.readlines("#{File.dirname(__FILE__)}/../inputs/day5.txt").map(&:chomp)
    middle = lines.index("")
    {
      fresh_ids: get_fresh_ids(lines[0..middle-1]),
      ingredient_ids: get_ingredient_ids(lines[middle+1..-1])
    }
  end

  def get_fresh_ids(lines)
    lines.each_with_object([]) do |l, arr|
      arr << l.split("-").map(&:to_i)
    end
  end

  def get_ingredient_ids(lines)
    lines.map(&:to_i)
  end

  def main
    lines = read_file
    
    puts "checking #{lines[:ingredient_ids].size} ingredient ids against #{lines[:fresh_ids].size} fresh ids"
    puts "part 1: #{part_1(lines[:fresh_ids], lines[:ingredient_ids])}"

    puts "checking #{lines[:fresh_ids].size} fresh id ranges for possible ids"
    puts "part 1: #{part_2(lines[:fresh_ids])}"
  end
end