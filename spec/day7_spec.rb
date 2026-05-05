require 'spec_helper'

describe 'Day 7' do
  describe '.part_1' do
    it "works on small sample" do
      sample = [
        ".......S.......",
        "...............",
        ".......^.......",
        "...............",
        "......^.^......",
        "...............",
        ".....^.^.^.....",
        "...............",
        "....^.^...^....",
        "...............",
        "...^.^...^.^...",
        "...............",
        "..^...^.....^..",
        "...............",
        ".^.^.^.^.^...^.",
        "..............."
      ]
      allow(Day7).to receive(:get_lines).and_return(sample)
      expect(Day7.part_1).to eq(21)
    end
  
    it "works" do
      expect(Day7.part_1).to eq(1605)
    end
  end

  describe '.part_2' do
    it "works on small sample" do
      sample = [
        ".......S.......",
        "...............",
        ".......^.......",
        "...............",
        "......^.^......",
        "...............",
        ".....^.^.^.....",
        "...............",
        "....^.^...^....",
        "...............",
        "...^.^...^.^...",
        "...............",
        "..^...^.....^..",
        "...............",
        ".^.^.^.^.^...^.",
        "..............."
      ]
      allow(Day7).to receive(:get_lines).and_return(sample)
      expect(Day7.part_2).to eq(40)
    end
  
    it "works" do
      expect(Day7.part_2).to eq(29893386035180)
    end
  end
end